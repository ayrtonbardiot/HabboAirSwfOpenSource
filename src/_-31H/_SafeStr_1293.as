// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1293

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1629;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1293 implements IMessageParser 
    {

        private var _SafeStr_7054:Array;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_7054 = [];
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7054.push(new _SafeStr_1629(_arg_1));
                _local_2++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7054 = null;
            return (true);
        }

        public function get nodes():Array
        {
            return (_SafeStr_7054);
        }


    }
}//package _-31H

// _SafeStr_1293 = "_-315" (String#6713, DoABC#3)
// _SafeStr_1629 = "_-K0" (String#7859, DoABC#3)
// _SafeStr_7054 = "_-F1t" (String#7556, DoABC#3)


