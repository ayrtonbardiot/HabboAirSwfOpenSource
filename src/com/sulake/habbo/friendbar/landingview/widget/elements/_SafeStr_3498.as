// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3498

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3489;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import _-41O._SafeStr_511;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.IRunningNumberWidget;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-61d._SafeStr_750;
    import flash.events.TimerEvent;

    public class _SafeStr_3498 implements IElementHandler, _SafeStr_13, _SafeStr_3491, ILayoutNameProvider, _SafeStr_3489 
    {

        private var _landingView:HabboLandingView;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6995:Boolean;
        private var _SafeStr_5182:Timer;
        private var _SafeStr_6996:Boolean;


        public function dispose():void
        {
            if (_landingView)
            {
                _landingView.communicationManager.removeHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
                _landingView = null;
            };
            if (_SafeStr_5182)
            {
                _SafeStr_5182.stop();
                _SafeStr_5182.removeEventListener("timer", onPollTimer);
                _SafeStr_5182 = null;
            };
            _window = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _landingView = _arg_1;
            _window = _SafeStr_3133(_arg_2);
            var _local_7:int = _arg_3[1];
            var _local_6:int = _arg_3[2];
            var _local_8:int = _arg_3[3];
            _SafeStr_6995 = (_arg_3[4] == "true");
            var _local_5:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("running_number_widget"));
            var _local_9:IRunningNumberWidget = IRunningNumberWidget(_local_5.widget);
            _local_9.digits = _local_7;
            _local_9.updateFrequency = _local_6;
            if (_SafeStr_6995)
            {
                _window.x = _arg_3[5];
                _window.y = _arg_3[6];
            };
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
            _SafeStr_5182 = new Timer(_local_8);
            _SafeStr_5182.addEventListener("timer", onPollTimer);
        }

        public function disable():void
        {
            _SafeStr_5182.stop();
        }

        public function refresh():void
        {
            _landingView.send(new _SafeStr_750());
            _SafeStr_6996 = false;
            _SafeStr_5182.start();
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return (_SafeStr_6995);
        }

        public function get layoutName():String
        {
            return ("element_community_goal_score");
        }

        private function onCommunityGoalProgress(_arg_1:_SafeStr_511):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (_landingView)
            {
                _local_4 = _arg_1.getParser().data;
                _local_2 = _SafeStr_3199(_window.findChildByName("running_number_widget"));
                _local_3 = IRunningNumberWidget(_local_2.widget);
                if (_SafeStr_6996)
                {
                    _local_3.number = _local_4.communityTotalScore;
                }
                else
                {
                    _local_3.initialNumber = _local_4.communityTotalScore;
                    _SafeStr_6996 = true;
                };
            };
        }

        private function onPollTimer(_arg_1:TimerEvent):void
        {
            _landingView.send(new _SafeStr_750());
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1572 = "_-E1A" (String#14274, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3489 = "_-A1S" (String#12070, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_3498 = "_-kt" (String#15145, DoABC#4)
// _SafeStr_511 = "_-z1e" (String#4648, DoABC#4)
// _SafeStr_5182 = "_-q1X" (String#3911, DoABC#4)
// _SafeStr_6995 = "_-jZ" (String#7298, DoABC#4)
// _SafeStr_6996 = "_-J1M" (String#13316, DoABC#4)
// _SafeStr_750 = "_-jP" (String#7227, DoABC#4)


