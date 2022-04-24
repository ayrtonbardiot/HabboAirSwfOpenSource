// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.AvatarEntersRoom

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class AvatarEntersRoom extends DefaultTriggerConf 
    {

        private var _cont:_SafeStr_3133;


        override public function get code():int
        {
            return (_SafeStr_3412.AVATAR_ENTERS_ROOM);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            var _local_2:String = getInput().text;
            return ((getCertainAvatarRadio().isSelected) ? _local_2 : "");
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _cont = _arg_1;
            getCertainAvatarRadio().addEventListener("WE_SELECT", onCertainAvatarSelect);
            getCertainAvatarRadio().addEventListener("WE_UNSELECT", onCertainAvatarUnselect);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            if (_arg_2.stringParam != "")
            {
                getSelector().setSelected(getCertainAvatarRadio());
                getInput().text = _arg_2.stringParam;
                getInput().visible = true;
            }
            else
            {
                getSelector().setSelected(getAnyAvatarRadio());
                getInput().text = "";
                getInput().visible = false;
            };
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput():ITextFieldWindow
        {
            return (ITextFieldWindow(_cont.findChildByName("avatar_name_txt")));
        }

        private function getCertainAvatarRadio():IRadioButtonWindow
        {
            return (IRadioButtonWindow(_cont.findChildByName("certain_avatar_radio")));
        }

        private function getAnyAvatarRadio():IRadioButtonWindow
        {
            return (IRadioButtonWindow(_cont.findChildByName("any_avatar_radio")));
        }

        private function getSelector():ISelectorWindow
        {
            return (ISelectorWindow(_cont.findChildByName("avatar_radio")));
        }

        private function onCertainAvatarSelect(_arg_1:_SafeStr_3116):void
        {
            getInput().visible = true;
        }

        private function onCertainAvatarUnselect(_arg_1:_SafeStr_3116):void
        {
            getInput().text = "";
            getInput().visible = false;
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3412 = "_-k1K" (String#4209, DoABC#4)


