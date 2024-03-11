/// returns whether the interaction oneliner should be displayed
function IB_onInteractionDisplayed(component: CInteractionComponent): bool {
  var noticeboard: W3NoticeBoard;
  var merchant: W3MerchantNPC;
  var container: W3Container;
  var action_name: name;
  var newnpc: CNewNPC;

  if (theInput.IsActionPressed('Interact') || theInput.IsActionPressed('InteractHold')) {
    action_name = component.GetInputActionName();

    // the key is already pressed, trigger the OnInteraction event directly ...
    container = (W3Container)component.GetEntity();
    if (container) {
      container.OnInteraction(action_name, (CEntity)thePlayer);
      return false;
    }

    noticeboard = (W3NoticeBoard)component.GetEntity();
    if (noticeboard) {
      noticeboard.OnInteraction(action_name, (CEntity)thePlayer);
      return false;
    }

    merchant = (W3MerchantNPC)component.GetEntity();
    if (merchant) {
      merchant.OnInteraction(action_name, (CEntity)thePlayer);
      return false;
    }

    newnpc = (CNewNPC)component.GetEntity();
    if (newnpc) {
      newnpc.OnInteraction(action_name, (CEntity)thePlayer);
      return false;
    }
  }

  return true;
}