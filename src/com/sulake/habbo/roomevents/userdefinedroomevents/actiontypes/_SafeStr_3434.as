// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3434

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class _SafeStr_3434 extends DefaultActionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3485.JOIN_TEAM);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:int = _arg_2.intParams[0];
            getTeamSelector(_arg_1).setSelected(getTeamRadio(_arg_1, _local_3));
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getTeamSelector(_arg_1).getSelected().id);
            return (_local_2);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getTeamRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("team_" + _arg_2) + "_radio"))));
        }

        private function getTeamSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("team_selector")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3434 = "_-8O" (String#15753, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)


