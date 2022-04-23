// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1486

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1486 implements IMessageParser 
    {

        private var _SafeStr_4655:int;
        private var _SafeStr_7061:Array;


        public function flush():Boolean
        {
            _SafeStr_7061 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            this._SafeStr_4655 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7061.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }

        public function get limit():int
        {
            return (_SafeStr_4655);
        }

        public function get favouriteRoomIds():Array
        {
            return (_SafeStr_7061);
        }


    }
}//package _-31H

// _SafeStr_1486 = "_-3O" (String#6773, DoABC#3)
// _SafeStr_4655 = "_-L1W" (String#7947, DoABC#3)
// _SafeStr_7061 = "_-q1H" (String#10044, DoABC#3)


