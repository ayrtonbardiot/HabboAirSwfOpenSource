// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3393

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import flash.events.Event;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class _SafeStr_3393 extends DefaultActionType 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_5574:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3485.MOVE_FURNI_TO);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getDirectionSelector(_arg_1).getSelected().id);
            _local_2.push(_SafeStr_5574.getValue());
            return (_local_2);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_5574 = new SliderWindowController(_arg_2, getInput(_arg_1), _arg_2.assets, 1, 5, 1);
            _SafeStr_5574.setValue(1);
            _SafeStr_5574.addEventListener("change", onSliderChange);
            _arg_2.refreshButton(_arg_1, "move_0", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_2", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_4", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_6", true, null, 0);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            getDirectionSelector(_arg_1).setSelected(getDirectionRadio(_arg_1, _local_3));
            _SafeStr_5574.setValue(_arg_2.intParams[1]);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("slider_container") as _SafeStr_3133);
        }

        private function onSliderChange(_arg_1:Event):void
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
                    _roomEvents.localization.registerParameter("wiredfurni.params.emptytiles", "tiles", ("" + _local_3));
                };
            };
        }

        private function getDirectionRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("direction_" + _arg_2) + "_radio"))));
        }

        private function getDirectionSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("direction_selector")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3393 = "_-417" (String#14704, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)


