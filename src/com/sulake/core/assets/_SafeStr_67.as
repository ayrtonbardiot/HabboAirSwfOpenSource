// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets._SafeStr_67

package com.sulake.core.assets
{
    import com.sulake.core.runtime._SafeStr_41;
    import __AS3__.vec.Vector;
    import com.sulake.core._SafeStr_79;

    public class _SafeStr_67 implements _SafeStr_41 
    {

        private var _SafeStr_5504:Vector.<ILazyAsset> = new Vector.<ILazyAsset>();
        private var _SafeStr_4016:Boolean = false;
        private var _disposed:Boolean = false;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_79.instance.removeUpdateReceiver(this);
                _SafeStr_5504 = null;
                _SafeStr_4016 = false;
                _disposed = true;
            };
        }

        public function push(_arg_1:ILazyAsset):void
        {
            if (_arg_1)
            {
                _SafeStr_5504.push(_arg_1);
                if (!_SafeStr_4016)
                {
                    _SafeStr_79.instance.registerUpdateReceiver(this, 2);
                    _SafeStr_4016 = true;
                };
            };
        }

        public function flush():void
        {
            for each (var _local_1:ILazyAsset in _SafeStr_5504)
            {
                if (!_local_1.disposed)
                {
                    _local_1.prepareLazyContent();
                };
            };
            _SafeStr_5504 = new Vector.<ILazyAsset>();
            if (_SafeStr_4016)
            {
                _SafeStr_79.instance.removeUpdateReceiver(this);
                _SafeStr_4016 = false;
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:ILazyAsset = _SafeStr_5504.shift();
            if (!_local_2)
            {
                if (_SafeStr_4016)
                {
                    _SafeStr_79.instance.removeUpdateReceiver(this);
                    _SafeStr_4016 = false;
                };
            }
            else
            {
                if (!_local_2.disposed)
                {
                    _local_2.prepareLazyContent();
                };
            };
        }


    }
}//package com.sulake.core.assets

// _SafeStr_4016 = "_-z1x" (String#10677, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)
// _SafeStr_5504 = "_-c1y" (String#9129, DoABC#3)
// _SafeStr_67 = "_-v" (String#10372, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)


