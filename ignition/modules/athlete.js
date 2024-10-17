const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const AthleteModule = buildModule("AthleteModule", (m) => {
  const athleteProfile  = m.contract("AthleteProfile", [], {});

  return { athleteProfile  };
});

module.exports = AthleteModule;
