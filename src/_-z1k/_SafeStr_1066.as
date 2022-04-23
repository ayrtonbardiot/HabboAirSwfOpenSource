// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1066

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1066 implements IMessageParser 
    {

        private var _SafeStr_3693:int;
        private var _roomName:String;
        private var _SafeStr_6385:int;


        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get messageCount():int
        {
            return (_SafeStr_6385);
        }

        public function flush():Boolean
        {
            _SafeStr_3693 = -1;
            _roomName = "";
            _SafeStr_6385 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _roomName = _arg_1.readString();
            _SafeStr_6385 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1066 = "_-W1A" (String#8666, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_6385 = "_-71K" (String#7016, DoABC#3)


