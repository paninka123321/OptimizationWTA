# Optimization - Weapon-Target Assignment (WTA) task
The aim of this study is to investigate models for task group (TG) air defense that captures the reality of anti-ship missiles (ASM) defense, generates an efficient allocation plan and measures the effectiveness of the air defense under a given scenario. Then we want to discuss the possible application of these models in other areas.

## Background
WTA problem can be stated as the optimal allocation of existing weapons to a set of targets. There are two versions of the WTA problem: static and dynamic. In the static version, all the inputs to the problem are fixed; that is, all targets are known, all weapons are known, and all weapons engage targets in a single stage. The dynamic version of the problem is a multi-stage problem where some weapons are engaged at the targets at a stage, the outcome of this engagement is assessed and strategy for the next stage is decided.
In this study we consider the case when the TG employs a shoot-look-shoot (SLS) tactic. The SLS tactic requires shooting at the target first, then looking to see if it was killed, and shooting again if necessary to achieve the kill. SLS firing policy has an implicit cost consideration. We only re-fire, if we have not already shot down the threatening ASM. Thus, we do not consume valuable SAM rounds, if it is not necessary.

An engagement process of a SAM system to an ASM can be divided into four phases. These are the tracking of the target illumination radar, the solution of the fire-control problem, the launch delay (i.e. the system delay between receiving the launch signal from the fire-control console and the missile leaving the launchers), and the flight time to the engagement.

Typical WTA problem (P) is a non-linear integer-programming model and with a convex objective function is shown to be NP-complete. In the studied models, we use additional constraints and an additional product form in the objective function compared to original WTA problem. Thanks to this we eliminate the non-linearity from the models making problem easier to solve.

## Assumptions
The basic assumptions that are needed for models are:
* The TG sees all the air threats to intercept simultaneously. Thus, we investigate the case where the attack size is known.
* The ships in the TG are capable of coordinating the allocation of the air defense.
* The incoming ASMs are assumed to be classified such as subsonic sea-skimmer, supersonic high diver, etc. Thus,
the single shot kill probability of each SAM against each ASM is known and does not change with the distance to
the ASM.
* The relative positions of the ships within TG do not change as the air raid continues. The ships are thought to be
stationary. This is a reasonable assumption since the speed of the ships is very low compared to the speed of the
ASMs.
* Defense systems may predict the eventual target of attacking ASMs.
* The TG has both point and anti-areal denial (AAD) missile systems. A point defense system may intercept the attackers that are attacking its own ship. An area defense system may intercept attackers within the area of its effective range.
* each SAM system is handeled separately even if they are of the same type as long as they are onboard different ships. This enables to capture the geometric differences that need to be studied to develop the best stationing tactics for the TG.

## Parameters
We assume that indices: i - states for number of incoming ASMs, j - states fo number of SAM systems onboard the warships composing the naval TG, v(i,j) - the ability of the SAM j system to attack the ASM i.
Parameters of models:
* u_i,j - the maximum number of missiles that can be launched from SAM system j against ASM i using a SLS tactic.
* p_i,j - the single shot kill probability of SAM system j against ASM i; 0 < p_i,j < 1
* d_j - he number of available rounds on SAM system j
* s_i - the maximum number of engagements that can be done against ASM i using a SLS tactic. This parameter will
be discussed in detail after the model presentation.

## Problem formulation
The orginal non-linear WTA problem, that is NP-complete:
(P) <pre> <details> <summary><strong>Mathematical Formulation of WTA NP-probelm (P) (click to expand)</strong></summary> ![WTA NP-problem](https://github.com/user-attachments/assets/ff16fe17-29ef-450b-9f2f-777e4f79cb18)

* xij : whether we launch missiles of SAM system j against ASM i or not 1 = true, 0 = false, (i, j ) ∈ v(i, j ).
