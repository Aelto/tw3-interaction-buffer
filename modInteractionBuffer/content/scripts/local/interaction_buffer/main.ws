/// returns whether the interaction oneliner should be displayed
function IB_onInteractionDisplayed(component: CInteractionComponent): bool {
  var noticeboard: W3NoticeBoard;
  var merchant: W3MerchantNPC;
  var container: W3Container;
  var action_name: name;
  var newnpc: CNewNPC;
  var herb: W3Herb;

  if (
    theInput.IsActionPressed('Interact')
    || theInput.IsActionPressed('InteractHold')
    || theInput.IsActionPressed('AutoTakeAll_BeginLootingSweep')
  ) {
    action_name = component.GetInputActionName();

    herb = (W3Herb)component.GetEntity();
    container = (W3Container)component.GetEntity();
    if (herb) {
      if (!herb.IsLocked()) {
        herb.ProcessLoot();
      }
    }

    // the key is already pressed, trigger the OnInteraction event directly ...
    else if (container) {
      if (!container.IsLocked()) {
        container.OnInteraction(action_name, (CEntity)thePlayer);
        return false;
      }
    }
  }

  return true;
}