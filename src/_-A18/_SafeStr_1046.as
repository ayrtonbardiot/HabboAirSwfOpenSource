// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-A18._SafeStr_1046

package _-A18
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1046 implements IMessageParser 
    {

        private var _stuffId:int;
        private var _SafeStr_5902:Boolean;


        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function get isOwner():Boolean
        {
            return (_SafeStr_5902);
        }

        public function flush():Boolean
        {
            _stuffId = -1;
            _SafeStr_5902 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _stuffId = _arg_1.readInteger();
            _SafeStr_5902 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-A18

// _SafeStr_1046 = "_-F12" (String#7527, DoABC#3)
// _SafeStr_5902 = "_-y1h" (String#10596, DoABC#3)


