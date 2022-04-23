// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1512

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1512 implements IMessageParser 
    {

        private var _flatId:int;
        private var _SafeStr_7062:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            this._SafeStr_7062 = _arg_1.readString();
            _SafeStr_14.log(((("FLAT CREATED: " + this._flatId) + ", ") + this._SafeStr_7062));
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get flatName():String
        {
            return (_SafeStr_7062);
        }


    }
}//package _-31H

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_1512 = "_-71o" (String#7028, DoABC#3)
// _SafeStr_7062 = "_-32D" (String#6740, DoABC#3)


