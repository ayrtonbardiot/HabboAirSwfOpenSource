// by nota

//com.sulake.habbo.communication.login.AvatarData

package com.sulake.habbo.communication.login
{
    public class AvatarData 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_5772:String;
        private var _name:String;
        private var _SafeStr_4880:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _head_figure:String;
        private var _last_access:int;
        private var _SafeStr_8388:Boolean;
        private var _SafeStr_8389:Boolean;
        private var _creationTime:String;

        public function AvatarData(_arg_1:Object)
        {
            if (_arg_1 != null)
            {
                _SafeStr_5772 = _arg_1.uniqueId;
                _name = _arg_1.name;
                _SafeStr_4880 = _arg_1.motto;
                _SafeStr_3819 = _arg_1.figureString;
                _SafeStr_3834 = _arg_1.gender;
                _last_access = _arg_1.lastWebAccess;
                _SafeStr_8388 = (_arg_1.habboClubMember == "true");
                _SafeStr_8389 = (_arg_1.buildersClubMember == "true");
                _creationTime = _arg_1.creationTime;
            };
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function get uniqueId():String
        {
            return (_SafeStr_5772);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get head_figure():String
        {
            return (_head_figure);
        }

        public function get last_access():int
        {
            return (_last_access);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }


    }
}//package com.sulake.habbo.communication.login

// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4880 = "_-v1" (String#10374, DoABC#3)
// _SafeStr_5772 = "_-Tk" (String#8530, DoABC#3)
// _SafeStr_8388 = "_-l1v" (String#9759, DoABC#3)
// _SafeStr_8389 = "_-pl" (String#10020, DoABC#3)


