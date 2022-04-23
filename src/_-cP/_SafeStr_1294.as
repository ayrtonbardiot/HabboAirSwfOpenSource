// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-cP._SafeStr_1294

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1294 implements IMessageParser 
    {

        private var _SafeStr_7179:int;
        private var _SafeStr_7180:int;
        private var _SafeStr_7181:int;
        private var _SafeStr_7182:int;
        private var _SafeStr_7183:int;


        public function get currentSongId():int
        {
            return (_SafeStr_7179);
        }

        public function get currentPosition():int
        {
            return (_SafeStr_7180);
        }

        public function get nextSongId():int
        {
            return (_SafeStr_7181);
        }

        public function get nextPosition():int
        {
            return (_SafeStr_7182);
        }

        public function get syncCount():int
        {
            return (_SafeStr_7183);
        }

        public function flush():Boolean
        {
            _SafeStr_7179 = -1;
            _SafeStr_7180 = -1;
            _SafeStr_7181 = -1;
            _SafeStr_7182 = -1;
            _SafeStr_7183 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7179 = _arg_1.readInteger();
            _SafeStr_7180 = _arg_1.readInteger();
            _SafeStr_7181 = _arg_1.readInteger();
            _SafeStr_7182 = _arg_1.readInteger();
            _SafeStr_7183 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1294 = "_-H1o" (String#7680, DoABC#3)
// _SafeStr_7179 = "_-m1f" (String#9810, DoABC#3)
// _SafeStr_7180 = "_-3K" (String#6769, DoABC#3)
// _SafeStr_7181 = "_-CU" (String#7393, DoABC#3)
// _SafeStr_7182 = "_-dc" (String#9243, DoABC#3)
// _SafeStr_7183 = "_-u1q" (String#10325, DoABC#3)


