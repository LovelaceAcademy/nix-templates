const path = require("path");
const webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const NodePolyfillPlugin = require("node-polyfill-webpack-plugin");

const isBrowser = !!process.env.BROWSER_RUNTIME;

const plugins = [
  new webpack.DefinePlugin({
    BROWSER_RUNTIME: isBrowser,
  }),
  new webpack.LoaderOptionsPlugin({
    debug: true,
  }),
  new HtmlWebpackPlugin({
    title: "pix-ctl-full",
    template: "./index.html",
    inject: false, // See stackoverflow.com/a/38292765/3067181
  }),
  // ContextReplacementPlugin is used just to suppress a webpack warning:
  // "Critical dependency: the request of a dependency is an expression"
  // See https://stackoverflow.com/a/59235546/17365145
  new webpack.ContextReplacementPlugin(/cardano-serialization-lib-browser/),
  new webpack.ContextReplacementPlugin(/cardano-serialization-lib-nodejs/),
];

if (isBrowser) {
  // Provide top-level `Buffer`
  plugins.push(
    new webpack.ProvidePlugin({
      Buffer: ["buffer", "Buffer"],
    }),
  );
  // Provide NodeJS polyfills
  plugins.push(new NodePolyfillPlugin());
}

module.exports = {
  mode: "development",
  target:  isBrowser ? "web" : "node18",
  node: isBrowser ? {} : { __dirname: true },
  experiments: {
    asyncWebAssembly: false,
    layers: false,
    lazyCompilation: false,
    outputModule: true,
    syncWebAssembly: true,
    topLevelAwait: true,
  },

  devtool: "eval-source-map",

  stats: { errorDetails: true },

  devServer: {
    port: 4008,
    proxy: {
      "/kupo": {
        // `KUPO_HOST` env variable must be set to the base URL of the Kupo
        // service, otherwise all requests to Kupo will fail.
        target: process.env.KUPO_HOST || "http://localhost:1442",
        changeOrigin: true,
        pathRewrite: { "^/kupo": "" },
      },
    },
  },
  
  watchOptions: {
    // optimizes rebuild
    aggregateTimeout: 1000,
  },

  // Preserves console.log calls in NodeJS
  // https://stackoverflow.com/a/71024096/17365145
  optimization:  isBrowser? {}: { minimize: false },

  // we can add more entrypoints as needed
  entry: "./index.js",

  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "bundle.js",
    library: {
      type: "module",
    },
  },

  resolve: {
    extensions: [".js"],
    fallback: isBrowser? {
      buffer: require.resolve("buffer/"),
      http: false,
      url: false,
      stream: false,
      crypto: false,
      https: false,
      net: false,
      tls: false,
      zlib: false,
      os: false,
      path: false,
      fs: false,
      readline: false,
      child_process: false,
    }: {},
  },

  plugins,
};
