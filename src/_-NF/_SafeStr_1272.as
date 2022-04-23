// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1272

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1272 implements IMessageParser 
    {

        private var _SafeStr_5431:int;
        private var _SafeStr_4128:int;
        private var _SafeStr_7441:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7441 = _arg_1.readInteger();
            return (true);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get supplementType():int
        {
            return (_SafeStr_7441);
        }


    }
}//package _-NF

// _SafeStr_1272 = "_-11k" (String#6555, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_7441 = "_-ih" (String#9569, DoABC#3)


