// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1087

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1087 implements IMessageParser 
    {

        private var _flatId:int = 0;


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
}//package _-l1n

// _SafeStr_1087 = "_-c12" (String#9103, DoABC#3)


