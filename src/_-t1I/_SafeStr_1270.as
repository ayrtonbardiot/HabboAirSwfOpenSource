// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1I._SafeStr_1270

package _-T1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1270 implements IMessageParser 
    {

        private var _SafeStr_7001:Boolean;
        private var _SafeStr_4061:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7001 = _arg_1.readBoolean();
            _SafeStr_4061 = _arg_1.readInteger();
            return (true);
        }

        public function get isPartOf():Boolean
        {
            return (_SafeStr_7001);
        }

        public function get targetId():int
        {
            return (_SafeStr_4061);
        }


    }
}//package _-T1I

// _SafeStr_1270 = "_-12T" (String#6572, DoABC#3)
// _SafeStr_4061 = "_-yK" (String#10618, DoABC#3)
// _SafeStr_7001 = "_-N1O" (String#8063, DoABC#3)


