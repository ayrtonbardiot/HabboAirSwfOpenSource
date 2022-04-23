// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1489

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1489 implements IMessageParser 
    {

        private var _flatId:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }


    }
}//package _-Z1C

// _SafeStr_1489 = "_-FV" (String#7567, DoABC#3)


