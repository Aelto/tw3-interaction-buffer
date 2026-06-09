@wrapMethod(CR4HudModuleInteractions)
function OnInteractionsUpdated(component : CInteractionComponent) {
  wrappedMethod(component);

  if (!IB_onInteractionDisplayed(component)) {
    this.bShowInteraction = false;
  }
}

@addField(CR4HudModuleInteractions)
var IB_was_used: bool;

@wrapMethod(CR4HudModuleInteractions)
function OnTick(delta: float) {
  wrappedMethod(delta);

  if (
    !this.IB_was_used
    && !IB_onInteractionDisplayed(this._interactionEntityComponent)
  ) {
    this.IB_was_used = true;
  }
}