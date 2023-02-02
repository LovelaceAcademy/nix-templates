// TODO remove ctl package to use purs-nix output on vite
//  this is a workaround to work with vite, but we need 
//  a better way to do that, see Plutonomicon/cardano-transaction-lib#79
//  alternative is @originjs/vite-plugin-commonjs, but we need originjs/vite-plugins#38
//  due BigNumbers require error
import { main } from 'ctl';

main ();
