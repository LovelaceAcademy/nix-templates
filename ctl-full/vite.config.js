import { defineConfig } from "vite"

import { NodeGlobalsPolyfillPlugin } from "@esbuild-plugins/node-globals-polyfill"
import { NodeModulesPolyfillPlugin } from "@esbuild-plugins/node-modules-polyfill"
import rollupNodePolyFill from "rollup-plugin-node-polyfills"
import wasm from "vite-plugin-wasm"

export default defineConfig({
  resolve: {
    alias: {
      util: "rollup-plugin-node-polyfills/polyfills/util",
      sys: "util",
      events: "rollup-plugin-node-polyfills/polyfills/events",
      stream: "rollup-plugin-node-polyfills/polyfills/stream",
      path: "rollup-plugin-node-polyfills/polyfills/path",
      querystring: "rollup-plugin-node-polyfills/polyfills/qs",
      punycode: "rollup-plugin-node-polyfills/polyfills/punycode",
      url: "rollup-plugin-node-polyfills/polyfills/url",
      string_decoder: "rollup-plugin-node-polyfills/polyfills/string-decoder",
      http: "rollup-plugin-node-polyfills/polyfills/http",
      https: "rollup-plugin-node-polyfills/polyfills/http",
      os: "rollup-plugin-node-polyfills/polyfills/os",
      assert: "rollup-plugin-node-polyfills/polyfills/assert",
      constants: "rollup-plugin-node-polyfills/polyfills/constants",
      _stream_duplex:
      "rollup-plugin-node-polyfills/polyfills/readable-stream/duplex",
      _stream_passthrough:
      "rollup-plugin-node-polyfills/polyfills/readable-stream/passthrough",
      _stream_readable:
      "rollup-plugin-node-polyfills/polyfills/readable-stream/readable",
      _stream_writable:
      "rollup-plugin-node-polyfills/polyfills/readable-stream/writable",
      _stream_transform:
      "rollup-plugin-node-polyfills/polyfills/readable-stream/transform",
      timers: "rollup-plugin-node-polyfills/polyfills/timers",
      console: "rollup-plugin-node-polyfills/polyfills/console",
      vm: "rollup-plugin-node-polyfills/polyfills/vm",
      zlib: "rollup-plugin-node-polyfills/polyfills/zlib",
      tty: "rollup-plugin-node-polyfills/polyfills/tty",
      domain: "rollup-plugin-node-polyfills/polyfills/domain"
    }
  },
  define: {
    BROWSER_RUNTIME: true,
    process: {}
  },
  build: {
    target: "esnext",
    commonjsOptions: {
      include: ["index.js", /node_modules/],
      transformMixedEsModules: true
    },
    rollupOptions: {
      external: ["rollup-plugin-node-polyfills", "util"]
    }
  },
  optimizeDeps: {
    force: true,
    include: [
      "ctl",
    ],
    exclude: [
      // FIXME should use emurgo deps from ctl-nix
      //  we're not using ctl-nix deps for emurgo because
      //  vite does not know how to resolve it
      //  given that we removed it from pre-bundling
      //  because it's already an es module
      //  see Plutonomicon/cardano-transaction-lib/#79
      "@emurgo/cardano-serialization-lib-browser",
      "@emurgo/cardano-message-signing-browser",
    ],
    esbuildOptions: {
      plugins: [
        NodeGlobalsPolyfillPlugin({
          process: true,
          buffer: true,
          define: {}
        }),
        NodeModulesPolyfillPlugin()
      ]
    }
  },
  plugins: [
    wasm(),
    rollupNodePolyFill()
  ],
  // TODO remove server is not needed
  //server: {
  //  fs: {
  //    allow: [".."]
  //  }
  //}
});
