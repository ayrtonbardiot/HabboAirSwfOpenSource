// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Po._SafeStr_167

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_167 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_7502:Array = [];


        public function getMessageArray():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            if (this._SafeStr_7502.length == 0)
            {
                _local_1.push(true);
                _local_1.push(0);
            }
            else
            {
                _local_1.push(false);
                _local_1.push(this._SafeStr_7502.length);
                _local_2 = 0;
                while (_local_2 < this._SafeStr_7502.length)
                {
                    _local_1.push(this._SafeStr_7502[_local_2]);
                    _local_2++;
                };
            };
            return (_local_1);
        }

        public function addDeclinedRequest(_arg_1:int):void
        {
            this._SafeStr_7502.push(_arg_1);
        }

        public function dispose():void
        {
            this._SafeStr_7502 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-Po

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_167 = "_-Uq" (String#8596, DoABC#3)
// _SafeStr_7502 = "_-pE" (String#10005, DoABC#3)


