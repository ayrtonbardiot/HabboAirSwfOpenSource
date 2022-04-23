// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-sq._SafeStr_1297

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1297 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_7526:String;


        public function flush():Boolean
        {
            _SafeStr_4128 = -1;
            _SafeStr_7526 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7526 = _arg_1.readString();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get chatMessage():String
        {
            return (_SafeStr_7526);
        }


    }
}//package _-sq

// _SafeStr_1297 = "_-21O" (String#6630, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7526 = "_-ma" (String#9834, DoABC#3)


