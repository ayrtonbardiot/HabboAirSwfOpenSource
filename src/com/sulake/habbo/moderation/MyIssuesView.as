// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.MyIssuesView

package com.sulake.habbo.moderation
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MyIssuesView implements IIssueBrowserView 
    {

        private var _SafeStr_3789:IssueManager;
        private var _SafeStr_4990:IssueBrowser;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6724:IssueListView;

        public function MyIssuesView(_arg_1:IssueManager, _arg_2:IssueBrowser, _arg_3:_SafeStr_3133)
        {
            _SafeStr_3789 = _arg_1;
            _SafeStr_4990 = _arg_2;
            _window = _arg_3;
            _window.visible = false;
            var _local_5:IItemListWindow = (_window.findChildByName("issue_list") as IItemListWindow);
            _SafeStr_6724 = new IssueListView(_arg_1, _arg_2, _local_5);
            var _local_4:_SafeStr_3109 = _window.findChildByName("release_all");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onReturnAll);
            };
        }

        public function get view():_SafeStr_3133
        {
            return (_window);
        }

        public function set visible(_arg_1:Boolean):void
        {
            _window.visible = _arg_1;
        }

        public function update():void
        {
            var _local_1:Array = _SafeStr_3789.getBundles("issue_bundle_my");
            _SafeStr_6724.update(_local_1);
        }

        private function onReturnAll(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_3789 == null)
            {
                return;
            };
            _SafeStr_3789.releaseAll();
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3789 = "_-310" (String#2581, DoABC#4)
// _SafeStr_4990 = "_-b1f" (String#3338, DoABC#4)
// _SafeStr_6724 = "_-W4" (String#6043, DoABC#4)


