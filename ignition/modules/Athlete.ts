// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const AthleteModule = buildModule("AthleteModule", (m) => {

  const athlete = m.contract("Athlete", [], {});

  return { athlete };
});

export default AthleteModule;
