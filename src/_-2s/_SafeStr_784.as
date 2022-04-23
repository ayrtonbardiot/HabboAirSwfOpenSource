// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-2s._SafeStr_784

package _-2s
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_784 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_784(_arg_1:int, _arg_2:Array, _arg_3:int)
        {
            var _local_4:int;
            super();
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(_arg_2.length);
            _local_4 = 0;
            while (_local_4 < _arg_2.length)
            {
                this._SafeStr_6600.push(_arg_2[_local_4]);
                _local_4++;
            };
            this._SafeStr_6600.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-2s

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_784 = "_-ZO" (String#8939, DoABC#3)


