// by nota

//com.sulake.habbo.groups.GuildSettingsData

package com.sulake.habbo.groups
{
    import _-W1K._SafeStr_1108;

    public class GuildSettingsData 
    {

        private var _SafeStr_6594:int = 0;
        private var _SafeStr_6595:int = 0;
        private var _SafeStr_6596:Boolean = false;

        public function GuildSettingsData(_arg_1:_SafeStr_1108=null)
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_6594 = _arg_1.guildType;
            _SafeStr_6595 = _arg_1.guildRightsLevel;
        }

        public function get guildType():int
        {
            return (_SafeStr_6594);
        }

        public function set guildType(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_6594)
            {
                _SafeStr_6596 = true;
            };
            _SafeStr_6594 = _arg_1;
        }

        public function get rightsLevel():int
        {
            return (_SafeStr_6595);
        }

        public function set rightsLevel(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_6595)
            {
                _SafeStr_6596 = true;
            };
            _SafeStr_6595 = _arg_1;
        }

        public function get isModified():Boolean
        {
            return (_SafeStr_6596);
        }

        public function resetModified():void
        {
            _SafeStr_6596 = false;
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1108 = "_-32v" (String#19381, DoABC#4)
// _SafeStr_6594 = "_-pK" (String#10889, DoABC#4)
// _SafeStr_6595 = "_-kd" (String#10648, DoABC#4)
// _SafeStr_6596 = "_-K8" (String#9004, DoABC#4)


