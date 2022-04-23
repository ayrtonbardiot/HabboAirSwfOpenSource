// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements.ConcurrentUsersInfoElementHandler

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import _-41O._SafeStr_786;
    import com.sulake.core.window._SafeStr_3109;
    import _-61d._SafeStr_961;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-61d._SafeStr_210;

    public class ConcurrentUsersInfoElementHandler implements IElementHandler, _SafeStr_13 
    {

        private static const STATE_DISABLED:int = 0;
        private static const STATE_ACTIVE:int = 1;
        private static const STATE_REDEEM:int = 2;
        private static const STATE_REWARDED:int = 3;
        private static const UPDATE_INTERVAL_MS:int = 5000;

        private var _landingView:HabboLandingView;
        private var _SafeStr_4981:GenericWidget;
        private var _localizationKey:String;
        private var _SafeStr_3734:int = -1;
        private var _SafeStr_6279:int = -1;
        private var _SafeStr_6994:int = -1;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5305:Timer;
        private var _SafeStr_4036:Boolean = false;

        public function ConcurrentUsersInfoElementHandler()
        {
            _SafeStr_5305 = new Timer(5000);
            _SafeStr_5305.addEventListener("timer", onUpdateTimer);
        }

        private function onUpdateTimer(_arg_1:TimerEvent):void
        {
            if ((((_window == null) || (_window.visible == false)) || (!(_landingView.isLandingViewVisible))))
            {
                return;
            };
            refresh();
        }

        public function dispose():void
        {
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
            _SafeStr_5305 = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _SafeStr_4981 = _arg_4;
            _landingView = _arg_1;
            _window = (_arg_2 as _SafeStr_3133);
            _localizationKey = _arg_3[1];
            _window.findChildByName("users_desc").caption = (("${" + _localizationKey) + "}");
            var _local_5:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_window.findChildByName("badge_image"));
            var _local_6:String = ((_arg_3.length > 2) ? _arg_3[2] : "ConcurrentUsersReward");
            var _local_7:String = (("${image.library.url}album1584/" + _local_6) + ".png");
            _local_5.assetUri = _local_7;
            updateLocalization();
            _arg_2.procedure = onButton;
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_786(onConcurrentUsersGoalProgress));
            _SafeStr_5305.start();
        }

        public function refresh():void
        {
            _landingView.send(new _SafeStr_961());
        }

        private function updateLocalization():void
        {
            var _local_4:String = "landing.view.concurrentusers.caption";
            var _local_3:String = "landing.view.concurrentusers.bodytext";
            _landingView.windowManager.registerLocalizationParameter(_localizationKey, "userCount", _SafeStr_6279.toString());
            _landingView.windowManager.registerLocalizationParameter(_localizationKey, "userGoal", _SafeStr_6994.toString());
            _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "userCount", _SafeStr_6279.toString());
            _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "userGoal", _SafeStr_6994.toString());
            _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "domain", _landingView.localizationManager.getLocalization("landing.view.hotel.domain", "Habbo"));
            switch (_SafeStr_3734)
            {
                case 0:
                    _window.findChildByName("state.active").visible = true;
                    _window.findChildByName("state.achieved").visible = false;
                    break;
                case 1:
                    _window.findChildByName("state.active").visible = true;
                    _window.findChildByName("state.achieved").visible = false;
                    break;
                case 2:
                    if (_SafeStr_5305)
                    {
                        _SafeStr_5305.stop();
                    };
                    _local_4 = (_local_4 + ".success");
                    _local_3 = (_local_3 + ".success");
                    _window.findChildByName("state.active").visible = false;
                    _window.findChildByName("state.active").enable();
                    _window.findChildByName("state.achieved").visible = true;
                    _window.findChildByName("action_button").visible = true;
                    break;
                case 3:
                    if (_SafeStr_5305)
                    {
                        _SafeStr_5305.stop();
                    };
                    _local_4 = (_local_4 + ".success");
                    _local_3 = (_local_3 + ".success");
                    _window.findChildByName("state.active").visible = false;
                    _window.findChildByName("state.achieved").visible = true;
                    _window.findChildByName("action_button").visible = false;
                default:
            };
            var _local_1:_SafeStr_3492 = (_SafeStr_4981.getElementByName("bodytext") as _SafeStr_3492);
            if (_local_1)
            {
                _local_1.localizationKey = _local_3;
            };
            var _local_2:_SafeStr_3492 = (_SafeStr_4981.getElementByName("caption") as _SafeStr_3492);
            if (_local_2)
            {
                _local_2.localizationKey = _local_4;
            };
        }

        private function onConcurrentUsersGoalProgress(_arg_1:_SafeStr_786):void
        {
            _SafeStr_3734 = _arg_1.getParser().state;
            _SafeStr_6279 = _arg_1.getParser().userCount;
            _SafeStr_6994 = _arg_1.getParser().userCountGoal;
            updateLocalization();
        }

        private function onButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                onClick();
            };
        }

        protected function onClick():void
        {
            _landingView.send(new _SafeStr_210());
            _landingView.send(new _SafeStr_961());
            _window.findChildByName("state.active").disable();
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_210 = "_-9j" (String#31058, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3492 = "_-c9" (String#8571, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5305 = "_-U1e" (String#2071, DoABC#4)
// _SafeStr_6279 = "_-tN" (String#5249, DoABC#4)
// _SafeStr_6994 = "_-g11" (String#8584, DoABC#4)
// _SafeStr_786 = "_-p1g" (String#11758, DoABC#4)
// _SafeStr_961 = "_-y1W" (String#19843, DoABC#4)


