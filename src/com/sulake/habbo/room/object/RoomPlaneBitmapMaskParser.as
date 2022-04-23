// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser

package com.sulake.habbo.room.object
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils._SafeStr_1675;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneBitmapMaskParser 
    {

        private var _SafeStr_5576:_SafeStr_24 = null;

        public function RoomPlaneBitmapMaskParser()
        {
            _SafeStr_5576 = new _SafeStr_24();
        }

        public function get maskCount():int
        {
            return (_SafeStr_5576.length);
        }

        public function dispose():void
        {
            if (_SafeStr_5576 != null)
            {
                reset();
                _SafeStr_5576.dispose();
                _SafeStr_5576 = null;
            };
        }

        public function initialize(_arg_1:XML):Boolean
        {
            var _local_3:int;
            var _local_14:* = null;
            var _local_12:* = null;
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_13:* = null;
            var _local_6:* = null;
            var _local_11:* = null;
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_5576.reset();
            var _local_7:Array = ["id", "type", "category"];
            var _local_8:Array = ["x", "y", "z"];
            var _local_9:XMLList;
            var _local_4:XMLList = _arg_1.planeMask;
            _local_3 = 0;
            while (_local_3 < _local_4.length())
            {
                _local_14 = _local_4[_local_3];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_14, _local_7))
                {
                    return (false);
                };
                _local_12 = _local_14.@id;
                _local_5 = _local_14.@type;
                _local_10 = null;
                _local_13 = _local_14.@category;
                _local_6 = _local_14.location;
                if (_local_6.length() != 1)
                {
                    return (false);
                };
                _local_11 = _local_6[0];
                if (!_SafeStr_1675.checkRequiredAttributes(_local_11, _local_8))
                {
                    return (false);
                };
                _local_10 = new Vector3d(Number(_local_11.@x), Number(_local_11.@y), Number(_local_11.@z));
                _local_2 = new RoomPlaneBitmapMaskData(_local_5, _local_10, _local_13);
                _SafeStr_5576.add(_local_12, _local_2);
                _local_3++;
            };
            return (true);
        }

        public function reset():void
        {
            var _local_1:int;
            var _local_2:* = null;
            _local_1 = 0;
            while (_local_1 < _SafeStr_5576.length)
            {
                _local_2 = (_SafeStr_5576.getWithIndex(_local_1) as RoomPlaneBitmapMaskData);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                };
                _local_1++;
            };
            _SafeStr_5576.reset();
        }

        public function addMask(_arg_1:String, _arg_2:String, _arg_3:IVector3d, _arg_4:String):void
        {
            var _local_5:RoomPlaneBitmapMaskData = new RoomPlaneBitmapMaskData(_arg_2, _arg_3, _arg_4);
            _SafeStr_5576.remove(_arg_1);
            _SafeStr_5576.add(_arg_1, _local_5);
        }

        public function removeMask(_arg_1:String):Boolean
        {
            var _local_2:RoomPlaneBitmapMaskData = (_SafeStr_5576.remove(_arg_1) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                _local_2.dispose();
                return (true);
            };
            return (false);
        }

        public function getXML():XML
        {
            var _local_4:int;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_2:XML = <planeMasks/>
			
			
            ;
            _local_4 = 0;
            while (_local_4 < maskCount)
            {
                _local_5 = getMaskType(_local_4);
                _local_6 = getMaskCategory(_local_4);
                _local_3 = new (XML)((((((("<planeMask id=" + (('"' + _local_4) + '"')) + " type=") + (('"' + _local_5) + '"')) + " category=") + (('"' + _local_6) + '"')) + "/>\r\n\t\t\t\t"));
                _local_1 = getMaskLocation(_local_4);
                if (_local_1 != null)
                {
                    _local_3.appendChild(new (XML)((((((("<location x=" + (('"' + _local_1.x) + '"')) + " y=") + (('"' + _local_1.y) + '"')) + " z=") + (('"' + _local_1.z) + '"')) + "/> ")));
                    _local_2.appendChild(_local_3);
                };
                _local_4++;
            };
            return (_local_2);
        }

        public function getMaskLocation(_arg_1:int):IVector3d
        {
            if (((_arg_1 < 0) || (_arg_1 >= maskCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneBitmapMaskData = (_SafeStr_5576.getWithIndex(_arg_1) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return (_local_2.loc);
            };
            return (null);
        }

        public function getMaskType(_arg_1:int):String
        {
            if (((_arg_1 < 0) || (_arg_1 >= maskCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneBitmapMaskData = (_SafeStr_5576.getWithIndex(_arg_1) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return (_local_2.type);
            };
            return (null);
        }

        public function getMaskCategory(_arg_1:int):String
        {
            if (((_arg_1 < 0) || (_arg_1 >= maskCount)))
            {
                return (null);
            };
            var _local_2:RoomPlaneBitmapMaskData = (_SafeStr_5576.getWithIndex(_arg_1) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return (_local_2.category);
            };
            return (null);
        }


    }
}//package com.sulake.habbo.room.object

// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_5576 = "_-8p" (String#2766, DoABC#4)


