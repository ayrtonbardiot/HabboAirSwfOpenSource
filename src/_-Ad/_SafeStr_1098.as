// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ad._SafeStr_1098

package _-Ad
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1098 implements IMessageParser 
    {

        private var _SafeStr_4615:int;
        private var _SafeStr_4723:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4615 = _arg_1.readInteger();
            _SafeStr_4723 = _arg_1.readString();
            return (true);
        }

        public function get badgeId():int
        {
            return (_SafeStr_4615);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }


    }
}//package _-Ad

// _SafeStr_1098 = "_-k12" (String#9659, DoABC#3)
// _SafeStr_4615 = "_-91W" (String#7167, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)


