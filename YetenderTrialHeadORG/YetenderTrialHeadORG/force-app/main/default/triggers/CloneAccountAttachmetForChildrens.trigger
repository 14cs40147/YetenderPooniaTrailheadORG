trigger CloneAccountAttachmetForChildrens on Attachment (after insert) {

    CloneAttacForChildrensController.onAfterInsert(trigger.new);
    
}