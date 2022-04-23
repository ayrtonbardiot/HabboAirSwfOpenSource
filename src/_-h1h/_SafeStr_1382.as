// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-h1h._SafeStr_1382

package _-h1h
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1382 implements IMessageParser 
    {

        private var _SafeStr_7258:String = "";
        private var _SafeStr_3693:int = 0;


        public function get roomType():String
        {
            return (_SafeStr_7258);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function flush():Boolean
        {
            _SafeStr_7258 = "";
            _SafeStr_3693 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7258 = _arg_1.readString();
            _SafeStr_3693 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-h1h

// _SafeStr_1382 = "_-u16" (String#10305, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7258 = "_-U1X" (String#8556, DoABC#3)


