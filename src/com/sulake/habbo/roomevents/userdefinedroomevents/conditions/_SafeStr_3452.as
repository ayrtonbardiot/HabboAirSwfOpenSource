// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3452

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import flash.events.Event;

    public class _SafeStr_3452 extends DefaultConditionType 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_6776:SliderWindowController;
        private var _SafeStr_6777:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3488.USER_COUNT_IN);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_USER_COUNT_IN);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(_SafeStr_6776.getValue());
            _local_2.push(_SafeStr_6777.getValue());
            return (_local_2);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_6776 = new SliderWindowController(_arg_2, getMinInput(_arg_1), _arg_2.assets, 1, 50, 1);
            _SafeStr_6776.addEventListener("change", onMinSliderChange);
            _SafeStr_6776.setValue(1);
            _SafeStr_6777 = new SliderWindowController(_arg_2, getMaxInput(_arg_1), _arg_2.assets, 1, 50, 1);
            _SafeStr_6777.addEventListener("change", onMaxSliderChange);
            _SafeStr_6777.setValue(50);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            var _local_4:int = _arg_2.intParams[1];
            _SafeStr_6776.setValue(_local_3);
            _SafeStr_6777.setValue(_local_4);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getMinInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("min_slider_container") as _SafeStr_3133);
        }

        private function getMaxInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("max_slider_container") as _SafeStr_3133);
        }

        private function onMinSliderChange(_arg_1:Event):void
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
                    _roomEvents.localization.registerParameter("wiredfurni.params.usercountmin", "value", ("" + _local_4));
                };
            };
        }

        private function onMaxSliderChange(_arg_1:Event):void
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
                    _roomEvents.localization.registerParameter("wiredfurni.params.usercountmax", "value", ("" + _local_3));
                };
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3452 = "_-ri" (String#15574, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)
// _SafeStr_6776 = "_-jl" (String#10386, DoABC#4)
// _SafeStr_6777 = "_-oi" (String#10290, DoABC#4)


