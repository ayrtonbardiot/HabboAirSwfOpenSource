// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups._SafeStr_3282

package com.sulake.habbo.groups
{
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window._SafeStr_3133;
    import _-W1K._SafeStr_1108;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class _SafeStr_3282 
    {

        public static const TYPE_REGULAR:int = 0;
        public static const TYPE_EXCLUSIVE:int = 1;
        public static const _SafeStr_7636:int = 2;
        public static const TYPE_LARGE:int = 3;
        public static const _SafeStr_7637:int = 4;
        public static const RIGHTS_MEMBERS:int = 0;
        public static const _SafeStr_8616:int = 1;

        private var _SafeStr_3740:GuildSettingsData;
        private var _SafeStr_5548:ISelectorWindow;
        private var _SafeStr_5544:IRadioButtonWindow;
        private var _SafeStr_5545:IRadioButtonWindow;
        private var _SafeStr_5546:IRadioButtonWindow;
        private var _SafeStr_5547:_SafeStr_3158;


        public function prepare(_arg_1:_SafeStr_3133):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.findChildByName("step_cont_5") as _SafeStr_3133);
            _SafeStr_5548 = (_local_2.findChildByName("group_type_selector") as ISelectorWindow);
            _SafeStr_5544 = (_local_2.findChildByName("rb_type_regular") as IRadioButtonWindow);
            _SafeStr_5544.procedure = onRegularGuildType;
            _SafeStr_5545 = (_local_2.findChildByName("rb_type_exclusive") as IRadioButtonWindow);
            _SafeStr_5545.procedure = onExclusiveGuildType;
            _SafeStr_5546 = (_local_2.findChildByName("rb_type_private") as IRadioButtonWindow);
            _SafeStr_5546.procedure = onPrivateGuildType;
            _SafeStr_5547 = (_local_2.findChildByName("cb_member_rights") as _SafeStr_3158);
            _SafeStr_5547.procedure = onMembersHaveRights;
        }

        public function refresh(_arg_1:_SafeStr_1108):void
        {
            _SafeStr_3740 = new GuildSettingsData(_arg_1);
            switch (_SafeStr_3740.guildType)
            {
                case 0:
                    _SafeStr_5548.setSelected(_SafeStr_5544);
                    break;
                case 1:
                    _SafeStr_5548.setSelected(_SafeStr_5545);
                    break;
                case 2:
                    _SafeStr_5548.setSelected(_SafeStr_5546);
                    break;
                default:
                    _SafeStr_5548.setSelected(_SafeStr_5544);
            };
            if (_SafeStr_3740.rightsLevel == 0)
            {
                _SafeStr_5547.select();
            }
            else
            {
                _SafeStr_5547.unselect();
            };
            _SafeStr_5548.invalidate();
        }

        private function onRegularGuildType(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_SELECT")
            {
                _SafeStr_3740.guildType = 0;
            };
        }

        private function onExclusiveGuildType(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_SELECT")
            {
                _SafeStr_3740.guildType = 1;
            };
        }

        private function onPrivateGuildType(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_SELECT")
            {
                _SafeStr_3740.guildType = 2;
            };
        }

        private function onMembersHaveRights(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_SELECT")
            {
                _SafeStr_3740.rightsLevel = 0;
            };
            if (_arg_1.type == "WE_UNSELECT")
            {
                _SafeStr_3740.rightsLevel = 1;
            };
        }

        public function resetModified():void
        {
            if (((!(_SafeStr_3740 == null)) && (_SafeStr_3740.isModified)))
            {
                _SafeStr_3740.resetModified();
            };
        }

        public function get guildType():int
        {
            return (_SafeStr_3740.guildType);
        }

        public function get rightsLevel():int
        {
            return (_SafeStr_3740.rightsLevel);
        }

        public function get isInitialized():Boolean
        {
            return (!(_SafeStr_3740 == null));
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1108 = "_-32v" (String#19381, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3282 = "_-dq" (String#13668, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_5544 = "_-ss" (String#12661, DoABC#4)
// _SafeStr_5545 = "_-s2" (String#15531, DoABC#4)
// _SafeStr_5546 = "_-NO" (String#13931, DoABC#4)
// _SafeStr_5547 = "_-z1G" (String#12181, DoABC#4)
// _SafeStr_5548 = "_-r13" (String#5084, DoABC#4)
// _SafeStr_7636 = "_-t17" (String#39501, DoABC#4)
// _SafeStr_7637 = "_-F1p" (String#39213, DoABC#4)
// _SafeStr_8616 = "_-Wg" (String#31899, DoABC#4)


