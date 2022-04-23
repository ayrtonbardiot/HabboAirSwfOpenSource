﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3453

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class _SafeStr_3453 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.MOVE_FURNI);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _arg_2.refreshButton(_arg_1, "move_0", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_2", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_4", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_6", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_diag", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_rnd", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_vrt", true, null, 0);
            _arg_2.refreshButton(_arg_1, "rotate_ccw", true, null, 0);
            _arg_2.refreshButton(_arg_1, "rotate_cw", true, null, 0);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            var _local_4:int = _arg_2.intParams[1];
            getMoveSelector(_arg_1).setSelected(getMoveRadio(_arg_1, _local_3));
            getRotateSelector(_arg_1).setSelected(getRotateRadio(_arg_1, _local_4));
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            var _local_4:int = getMoveSelector(_arg_1).getSelected().id;
            var _local_3:int = getRotateSelector(_arg_1).getSelected().id;
            _local_2.push(_local_4);
            _local_2.push(_local_3);
            return (_local_2);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getMoveRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("move_" + _arg_2) + "_radio"))));
        }

        private function getRotateRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("rotate_" + _arg_2) + "_radio"))));
        }

        private function getMoveSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("move_selector")));
        }

        private function getRotateSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("rotate_selector")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3453 = "_-91P" (String#15059, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


