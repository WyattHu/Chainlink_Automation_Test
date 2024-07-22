const { network } = require("hardhat");
const {
    networkconfig,
    developmentChains,
} = require("../hardhat-config-helper");
require("dotenv").config();
const { verify } = require("../utility/verify");

module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments;
    const { deployer } = await getNamedAccounts();
    const chainId = network.config.chainId;
    let ChainlinkAutomationTest;
    log('chainId:' + chainId)
    log(deployer)
    log("Deploying ChainlinkAutomationTest Contract...");

    ChainlinkAutomationTest = await deploy("ChainlinkAutomationTest", {
        contract: "ChainlinkAutomationTest",
        from: deployer,
        log: true,
        args: [],
        waitConfirmations: network.config.blockConfirmations || 1,
    });


    log("------------------------------------------------");
    log(`ChainlinkAutomationTest deployed at ${ChainlinkAutomationTest.address}`);

    if (
        !developmentChains.includes(network.name) &&
        process.env.ETHERSCAN_API_KEY
    ) {
        await verify(ChainlinkAutomationTest.address, []);
    }
};
module.exports.tags = ["all", "ChainlinkAutomationTest"];
