// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.GiveScore

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import flash.events.Event;

    public class GiveScore extends DefaultActionType 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_5574:SliderWindowController;
        private var _SafeStr_6587:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3485.GIVE_SCORE);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(_SafeStr_5574.getValue());
            _local_2.push(_SafeStr_6587.getValue());
            return (_local_2);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_5574 = new SliderWindowController(_arg_2, getInput(_arg_1), _arg_2.assets, 1, 100, 1);
            _SafeStr_5574.addEventListener("change", onSliderChange);
            _SafeStr_5574.setValue(1);
            _SafeStr_6587 = new SliderWindowController(_arg_2, getCounterInput(_arg_1), _arg_2.assets, 1, 10, 1);
            _SafeStr_6587.addEventListener("change", onCounterSliderChange);
            _SafeStr_6587.setValue(1);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            var _local_4:int = _arg_2.intParams[1];
            _SafeStr_5574.setValue(_local_3);
            _SafeStr_6587.setValue(_local_4);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("slider_container") as _SafeStr_3133);
        }

        private function getCounterInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("counter_slider_container") as _SafeStr_3133);
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
                    _roomEvents.localization.registerParameter("wiredfurni.params.setpoints", "points", ("" + _local_4));
                };
            };
        }

        private function onCounterSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:Number;
            var _local_3:int;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_4 = _local_2.getValue();
                    _local_3 = _local_4;
                    _roomEvents.localization.registerParameter("wiredfurni.params.settimesingame", "times", ("" + _local_3));
                };
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)
// _SafeStr_6587 = "_-r1X" (String#10970, DoABC#4)


