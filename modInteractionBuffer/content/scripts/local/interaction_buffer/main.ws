/// returns whether the interaction oneliner should be displayed
function IB_onInteractionDisplayed(component: CInteractionComponent): bool {
  var action_name: name;

  if (theInput.IsActionPressed('Interact') || theInput.IsActionPressed('InteractHold')) {
    action_name = component.GetInputActionName();
    component.OnInteraction(action_name, (CEntity)thePlayer);

    return false;
  }

  return true;
}