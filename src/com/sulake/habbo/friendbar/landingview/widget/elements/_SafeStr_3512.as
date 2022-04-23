// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3512

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import _-41O._SafeStr_786;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3512 implements IElementHandler, _SafeStr_3491 
    {

        private var _SafeStr_4204:IStaticBitmapWrapperWindow;
        private var _SafeStr_3734:int;
        private var _SafeStr_6279:int;
        private var _SafeStr_6994:int;


        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _SafeStr_4204 = IStaticBitmapWrapperWindow(_arg_2);
            var _local_5:String = _arg_3[1];
            _SafeStr_4204.assetUri = _local_5;
            _SafeStr_4204.x = ((_arg_3.length > 2) ? _arg_3[2] : 0);
            _SafeStr_4204.y = ((_arg_3.length > 3) ? _arg_3[3] : 0);
            _SafeStr_14.log(("Init Concurrent users meter: " + _local_5));
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_786(onConcurrentUsersGoalProgress));
        }

        public function refresh():void
        {
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return (true);
        }

        private function onConcurrentUsersGoalProgress(_arg_1:_SafeStr_786):void
        {
            _SafeStr_3734 = _arg_1.getParser().state;
            _SafeStr_6279 = _arg_1.getParser().userCount;
            _SafeStr_6994 = _arg_1.getParser().userCountGoal;
            var _local_3:int = int(((_SafeStr_6279 / _SafeStr_6994) * 100));
            _local_3 = Math.max(20, Math.min(100, _local_3));
            _local_3 = int((Math.floor((_local_3 / 10)) * 10));
            var _local_2:String = ("challenge_meter_" + _local_3);
            _SafeStr_4204.assetUri = (("${image.library.url}reception/" + _local_2) + ".png");
            _SafeStr_14.log(("Updating meter: " + _local_2));
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_3512 = "_-w6" (String#14609, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_6279 = "_-tN" (String#5249, DoABC#4)
// _SafeStr_6994 = "_-g11" (String#8584, DoABC#4)
// _SafeStr_786 = "_-p1g" (String#11758, DoABC#4)


