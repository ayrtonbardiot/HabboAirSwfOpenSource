// by nota

//com.sulake.habbo.quest.AchievementResolutionCompletedView

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3133;

    public class AchievementResolutionCompletedView implements _SafeStr_13 
    {

        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8702:String = "cancel_button";

        private var _SafeStr_4360:AchievementsResolutionController;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4723:String;
        private var _SafeStr_7123:String;

        public function AchievementResolutionCompletedView(_arg_1:AchievementsResolutionController)
        {
            _SafeStr_4360 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (!(_SafeStr_4360 == null));
        }

        public function get visible():Boolean
        {
            if (!_window)
            {
                return (false);
            };
            return (_window.visible);
        }

        public function show(_arg_1:String, _arg_2:String):void
        {
            if (_window == null)
            {
                createWindow();
            };
            initializeWindow();
            _SafeStr_7123 = _arg_1;
            _SafeStr_4723 = _arg_2;
            setBadge(_SafeStr_4723);
            _window.visible = true;
        }

        private function createWindow():void
        {
            _window = _SafeStr_3263(_SafeStr_4360.questEngine.getXmlWindow("AchievementResolutionCompleted"));
            addClickListener("header_button_close");
            addClickListener("cancel_button");
        }

        private function addClickListener(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseClick);
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    close();
                    return;
            };
        }

        private function initializeWindow():void
        {
            _window.center();
        }

        private function setBadge(_arg_1:String):void
        {
            var _local_3:_SafeStr_3199 = (_window.findChildByName("achievement_badge") as _SafeStr_3199);
            var _local_2:_SafeStr_3349 = (_local_3.widget as _SafeStr_3349);
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_3.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_2.badgeId = _arg_1;
            _local_3.visible = true;
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4723 = "_-41q" (String#3526, DoABC#4)
// _SafeStr_7123 = "_-LZ" (String#23353, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8702 = "_-H1q" (String#14548, DoABC#4)


