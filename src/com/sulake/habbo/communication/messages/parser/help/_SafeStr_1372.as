// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1372

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1372 implements IMessageParser 
    {

        private var _SafeStr_4625:int;
        private var _requesterName:String;
        private var _SafeStr_8473:String;
        private var _SafeStr_8474:int;
        private var _guideName:String;
        private var _SafeStr_6817:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4625 = _arg_1.readInteger();
            _requesterName = _arg_1.readString();
            _SafeStr_8473 = _arg_1.readString();
            _SafeStr_8474 = _arg_1.readInteger();
            _guideName = _arg_1.readString();
            _SafeStr_6817 = _arg_1.readString();
            return (true);
        }

        public function get requesterUserId():int
        {
            return (_SafeStr_4625);
        }

        public function get requesterName():String
        {
            return (_requesterName);
        }

        public function get requesterFigure():String
        {
            return (_SafeStr_8473);
        }

        public function get guideUserId():int
        {
            return (_SafeStr_8474);
        }

        public function get guideName():String
        {
            return (_guideName);
        }

        public function get guideFigure():String
        {
            return (_SafeStr_6817);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1372 = "_-j1I" (String#9594, DoABC#3)
// _SafeStr_4625 = "_-Z5" (String#8928, DoABC#3)
// _SafeStr_6817 = "_-L1F" (String#7938, DoABC#3)
// _SafeStr_8473 = "_-Y1s" (String#8855, DoABC#3)
// _SafeStr_8474 = "_-p1j" (String#9993, DoABC#3)


