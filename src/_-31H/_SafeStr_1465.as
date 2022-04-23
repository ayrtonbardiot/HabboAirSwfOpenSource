// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1465

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1465 implements IMessageParser 
    {

        private var _flatId:int;
        private var _SafeStr_7058:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            this._SafeStr_7058 = _arg_1.readInteger();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }


    }
}//package _-31H

// _SafeStr_1465 = "_-8f" (String#7137, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)


