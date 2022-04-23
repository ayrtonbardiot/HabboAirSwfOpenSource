// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.cache._SafeStr_3404

package com.sulake.room.renderer.cache
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;

    [SecureSWF(rename="true")]
    public class _SafeStr_3404 
    {

        private var _SafeStr_4804:String = "";
        private var _SafeStr_4072:int = -1;
        private var _SafeStr_6575:int = -1;
        private var _SafeStr_6576:Vector3d = new Vector3d();
        private var _SafeStr_6577:Vector3d = null;
        private var _SafeStr_6574:Boolean = false;

        public function _SafeStr_3404(_arg_1:String)
        {
            _SafeStr_4804 = _arg_1;
            _SafeStr_6577 = new Vector3d();
        }

        public function get locationChanged():Boolean
        {
            return (_SafeStr_6574);
        }

        public function dispose():void
        {
            _SafeStr_6577 = null;
        }

        public function getScreenLocation(_arg_1:IRoomObject, _arg_2:IRoomGeometry):IVector3d
        {
            var _local_8:* = null;
            var _local_3:Number;
            var _local_4:* = null;
            var _local_6:* = null;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return (null);
            };
            var _local_5:Boolean;
            var _local_7:IVector3d = _arg_1.getLocation();
            if (((!(_arg_2.updateId == _SafeStr_4072)) || (!(_arg_1.getUpdateID() == _SafeStr_6575))))
            {
                _SafeStr_6575 = _arg_1.getUpdateID();
                if (((((!(_arg_2.updateId == _SafeStr_4072)) || (!(_local_7.x == _SafeStr_6576.x))) || (!(_local_7.y == _SafeStr_6576.y))) || (!(_local_7.z == _SafeStr_6576.z))))
                {
                    _SafeStr_4072 = _arg_2.updateId;
                    _SafeStr_6576.assign(_local_7);
                    _local_5 = true;
                };
            };
            _SafeStr_6574 = _local_5;
            if (_local_5)
            {
                _local_8 = _arg_2.getScreenPosition(_local_7);
                if (_local_8 == null)
                {
                    return (null);
                };
                _local_3 = _arg_1.getModel().getNumber(_SafeStr_4804);
                if (((isNaN(_local_3)) || (_local_3 == 0)))
                {
                    _local_4 = new Vector3d(Math.round(_local_7.x), Math.round(_local_7.y), _local_7.z);
                    if (((!(_local_4.x == _local_7.x)) || (!(_local_4.y == _local_7.y))))
                    {
                        _local_6 = _arg_2.getScreenPosition(_local_4);
                        _SafeStr_6577.assign(_local_8);
                        if (_local_6 != null)
                        {
                            _SafeStr_6577.z = _local_6.z;
                        };
                    }
                    else
                    {
                        _SafeStr_6577.assign(_local_8);
                    };
                }
                else
                {
                    _SafeStr_6577.assign(_local_8);
                };
                _SafeStr_6577.x = Math.round(_SafeStr_6577.x);
                _SafeStr_6577.y = Math.round(_SafeStr_6577.y);
            };
            return (_SafeStr_6577);
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_3404 = "_-FN" (String#9282, DoABC#4)
// _SafeStr_4072 = "_-Ds" (String#2730, DoABC#4)
// _SafeStr_4804 = "_-b1p" (String#6471, DoABC#4)
// _SafeStr_6574 = "_-V1e" (String#21804, DoABC#4)
// _SafeStr_6575 = "_-D1Z" (String#18986, DoABC#4)
// _SafeStr_6576 = "_-V6" (String#10444, DoABC#4)
// _SafeStr_6577 = "_-n1W" (String#5207, DoABC#4)


