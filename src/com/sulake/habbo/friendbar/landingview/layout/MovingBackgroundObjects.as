// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.MovingBackgroundObjects

package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.utils._SafeStr_24;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects._SafeStr_3484;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.BackgroundObject;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.*;

    public class MovingBackgroundObjects implements _SafeStr_13, _SafeStr_41 
    {

        private static const MAX_OBJECTS:int = 20;

        private var _landingView:HabboLandingView;
        private var _SafeStr_4621:Array = [];
        private var _SafeStr_6825:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_3983:EventDispatcher = new EventDispatcher();
        private var _SafeStr_6826:String = "";

        public function MovingBackgroundObjects(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
            initializeObjectTypeMapping();
        }

        private function initializeObjectTypeMapping():void
        {
            _SafeStr_6825.add("line", _SafeStr_3484.CLASS_LINEAR);
            _SafeStr_6825.add("spiral", _SafeStr_3484.CLASS_SPIRAL);
            _SafeStr_6825.add("animated", _SafeStr_3484.CLASS_STATIC_ANIMATED);
            _SafeStr_6825.add("randomwalk", _SafeStr_3484.CLASS_RANDOM_WALK);
        }

        public function dispose():void
        {
            _landingView = null;
            for each (var _local_1:BackgroundObject in _SafeStr_4621)
            {
                _local_1.dispose();
            };
            _SafeStr_4621 = null;
            _SafeStr_6825.reset();
            _SafeStr_6825 = null;
            _SafeStr_3983 = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function initialize(_arg_1:_SafeStr_3133):void
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_3:* = null;
            _arg_1 = _SafeStr_3133(_arg_1.findChildByName("moving_objects_container"));
            if (_arg_1 == null)
            {
                return;
            };
            if (_SafeStr_4621.length > 0)
            {
                return;
            };
            _local_4 = 1;
            while (_local_4 <= 20)
            {
                if (_SafeStr_6826 == "")
                {
                    _local_2 = _landingView.getProperty(("landing.view.bgobject." + _local_4));
                }
                else
                {
                    _local_2 = _landingView.getProperty(((("landing.view." + _SafeStr_6826) + ".bgobject.") + _local_4));
                };
                if (_local_2 != "")
                {
                    _local_3 = getObjectByDataContent(_local_4, _local_2, _arg_1);
                    if (_local_3 != null)
                    {
                        _SafeStr_4621.push(_local_3);
                    };
                };
                _local_4++;
            };
        }

        public function update(_arg_1:uint):void
        {
            for each (var _local_2:BackgroundObject in _SafeStr_4621)
            {
                _local_2.update(_arg_1);
            };
        }

        private function getObjectByDataContent(_arg_1:int, _arg_2:String, _arg_3:_SafeStr_3133):BackgroundObject
        {
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_4:Array = _arg_2.split(";");
            if (_local_4.length >= 2)
            {
                _local_6 = _local_4[1];
                _local_5 = _SafeStr_6825.getValue(_local_6);
                if (_local_5 != null)
                {
                    return (new _local_5(_arg_1, _arg_3, _SafeStr_3983, _landingView, _arg_2));
                };
            };
            return (null);
        }

        public function set timingCode(_arg_1:String):void
        {
            _SafeStr_6826 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3484 = "_-W0" (String#10575, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4621 = "_-21w" (String#2166, DoABC#4)
// _SafeStr_6825 = "_-128" (String#6756, DoABC#4)
// _SafeStr_6826 = "_-j1w" (String#14129, DoABC#4)


