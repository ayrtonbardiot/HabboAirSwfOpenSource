// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.ScoreAchieved

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import flash.events.Event;

    public class ScoreAchieved extends DefaultTriggerConf 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_5574:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3412.SCORE_ACHIEVED);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(_SafeStr_5574.getValue());
            return (_local_2);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_5574 = new SliderWindowController(_arg_2, getInput(_arg_1), _arg_2.assets, 1, 1000, 1);
            _SafeStr_5574.setValue(1);
            _SafeStr_5574.addEventListener("change", onSliderChange);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            _SafeStr_5574.setValue(_local_3);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("score_slider_cont") as _SafeStr_3133);
        }

        private function onSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:Number;
            var _local_4:int;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_3 = _local_2.getValue();
                    _local_4 = _local_3;
                    _roomEvents.localization.registerParameter("wiredfurni.params.setscore", "points", ("" + _local_4));
                };
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3412 = "_-k1K" (String#4209, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)


