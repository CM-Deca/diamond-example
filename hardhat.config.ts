import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import 'hardhat-gas-reporter';
import 'hardhat-contract-sizer';
import * as dotenv from 'dotenv';

dotenv.config();

const config: HardhatUserConfig = {

  networks:{
    polygon_mumbai: {
      url: 'https://matic-mumbai.chainstacklabs.com',
      accounts: [process.env.PRIVATE_KEY || ''],
      gas: 20000000
   },

  },

  solidity: {
    version : "0.8.19",
    settings: {
      viaIR: true, // 가스비, 사이즈에 영향 끼칠 요소1 
      optimizer: {
          enabled: true,
          runs: 200, // 가스비, 사이즈에 영향 끼칠 요소2
      }
    
    }
  },

  etherscan: {
    apiKey: process.env.POLYGONSCAN_API_KEY
  },

  gasReporter: {
    enabled: true,
    currency: 'USD',
    gasPrice: 21
  }

};

export default config;
