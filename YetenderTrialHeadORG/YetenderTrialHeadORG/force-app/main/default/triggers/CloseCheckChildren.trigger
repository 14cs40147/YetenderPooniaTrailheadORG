trigger CloseCheckChildren on Account (after update) {

    CloseCheckChildrenHelper.onAfterUpdate(trigger.new, trigger.oldMap);
}