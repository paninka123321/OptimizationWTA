# Optimization - Weapon-Target Assignment (WTA) task
The aim of this study is to investigate models for task group (TG) air defense that captures the reality of anti-ship missiles (ASM) defense, generates an efficient allocation plan and measures the effectiveness of the air defense under a given scenario. Then we want to discuss the possible application of these models in other areas.

## Background
WTA problem can be stated as the optimal allocation of existing weapons to a set of targets. In this study we consider the case when the TG employs a shoot-look-shoot (SLS) tactic. The SLS tactic requires shooting at the target first, then looking to see if it was killed, and shooting again if necessary to achieve the kill. SLS firing policy has an implicit cost consideration. We only re-fire, if we have not already shot down the threatening ASM. Thus, we do not consume valuable SAM rounds, if it is not necessary.

An engagement process of a SAM system to an ASM can be divided into four phases. These are the tracking of the target illumination radar, the solution of the fire-control problem, the launch delay (i.e. the system delay between receiving the launch signal from the fire-control console and the missile leaving the launchers), and the flight time to the engagement.

## Assumptions
The basic assumptions that are needed for models are:
• The TG sees all the air threats to intercept simultaneously. Thus, we investigate the case where the attack size is known.
• The ships in the TG are capable of coordinating the allocation of the air defense.
• The incoming ASMs are assumed to be classified such as subsonic sea-skimmer, supersonic high diver, etc. Thus,
the single shot kill probability of each SAM against each ASM is known and does not change with the distance to
the ASM.
• The relative positions of the ships within TG do not change as the air raid continues. The ships are thought to be
stationary. This is a reasonable assumption since the speed of the ships is very low compared to the speed of the
ASMs.
• Defense systems may predict the eventual target of attacking ASMs.
• The TG has both point and anti-areal denial (AAD) missile systems. A point defense system may intercept the attackers that are attacking its own ship. An area defense system may intercept attackers within the area of its effective range.
* each SAM system is handeled separately even if they are of the same type as long as they are onboard different ships. This enables to capture the geometric differences that need to be studied to develop the best stationing tactics for the TG.

