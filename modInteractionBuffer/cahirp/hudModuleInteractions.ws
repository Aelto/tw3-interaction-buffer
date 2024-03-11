@context(
  define("mod.interactionBuffer")
  file("game/gui/hud/modules/hudModuleInteractions.ws")
  at(class CR4HudModuleInteractions)
)

@insert(
  note("")
  at(event OnInteractionsUpdated)
  at(m_fxSetInteractionHoldDuration.InvokeSelfOneArg)
)
// BEGIN
bShowInteraction = IB_onInteractionDisplayed(component);
// END

