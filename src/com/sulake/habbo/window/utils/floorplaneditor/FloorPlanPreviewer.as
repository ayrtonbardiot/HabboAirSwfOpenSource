// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils.floorplaneditor.FloorPlanPreviewer

package com.sulake.habbo.window.utils.floorplaneditor
{
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.geom.Point;

    public class FloorPlanPreviewer 
    {

        public static var tile_preview_0:Class = tile_preview_0_png$eb6ee9f516522093422b52292f9e8ec11109157272;
        public static var tile_preview_1:Class = tile_preview_1_png$75ce8f3d02e0e8bb269a02e29af425811114536985;
        public static var tile_preview_2:Class = tile_preview_2_png$cb9c6a834dd035747d492944d6e37e8b1114657946;
        public static var tile_preview_3:Class = tile_preview_3_png$82f88a8a6f49d9771db61c84961137fc1111666459;
        public static var tile_preview_4:Class = tile_preview_4_png$5ea65399b740e0d98af1e469a8e10c481112835988;
        public static var tile_preview_5:Class = tile_preview_5_png$900862b1b5c3ac270d617c55e769563e1101438485;
        public static var tile_preview_6:Class = tile_preview_6_png$28eddf1319b72fdd217e9e4df4e017251101592214;
        public static var tile_preview_7:Class = tile_preview_7_png$325d423d950020b8e9d2bbd143a4db711102758167;
        public static var tile_preview_8:Class = tile_preview_8_png$3268b80421edaaf3ffa1b34ebcf73c171099749776;
        public static var tile_preview_9:Class = tile_preview_9_png$e62aa42e3fb9b9db52d702b46c8eea591100951569;
        public static var tile_preview_a:Class = tile_preview_a_png$95e5a1285d77442262c00c89f568d75f1607132617;
        public static var tile_preview_b:Class = tile_preview_b_png$34490a2792a46fceae1ed1857abcbc5a1608318026;
        public static var tile_preview_c:Class = tile_preview_c_png$de22ebdbe2b946013e46ff86b7a6102d1596904651;
        public static var tile_preview_d:Class = tile_preview_d_png$39fc6a86d930b766fa589ddd96273f8d1597058884;
        public static var tile_preview_e:Class = tile_preview_e_png$810de490c513f8bc619ed9ef0a3232cc1594034117;
        public static var tile_preview_f:Class = tile_preview_f_png$9aad22f410629ea378b0a610d837f8a01595219526;
        public static var tile_preview_entry:Class = _SafeStr_3478;

        private var _bcFloorPlanEditor:BCFloorPlanEditor;
        private var _tileImages:Vector.<BitmapData>;
        private var _floorPlan:FloorPlanCache;

        public function FloorPlanPreviewer(_arg_1:BCFloorPlanEditor)
        {
            _bcFloorPlanEditor = _arg_1;
            _floorPlan = _arg_1.floorPlanCache;
            _tileImages = new Vector.<BitmapData>(0);
            _tileImages.push(Bitmap(new tile_preview_0()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_1()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_2()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_3()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_4()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_5()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_6()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_7()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_8()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_9()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_a()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_b()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_c()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_d()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_e()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_f()).bitmapData);
            _tileImages.push(Bitmap(new tile_preview_entry()).bitmapData);
        }

        private static function getCanvasPoint(_arg_1:int, _arg_2:int, _arg_3:int):Point
        {
            return (new Point((8 * (_arg_1 - _arg_2)), ((4 * (_arg_1 + _arg_2)) - (8 * _arg_3))));
        }


        public function updatePreview():void
        {
            var _local_20:int;
            var _local_22:int;
            var _local_23:int;
            var _local_11:* = null;
            var _local_5:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_4:int;
            var _local_16:int;
            var _local_15:Array = [];
            var _local_18:* = 2147483647;
            var _local_17:* = 2147483647;
            var _local_2:* = -2147483648;
            var _local_1:* = -2147483648;
            _local_22 = 0;
            while (_local_22 < _floorPlan.floorHeight)
            {
                _local_20 = 0;
                while (_local_20 < _floorPlan.floorWidth)
                {
                    _local_23 = _floorPlan.getHeightAt(_local_20, _local_22);
                    if (_local_23 >= 0)
                    {
                        _local_11 = getCanvasPoint(_local_20, _local_22, _local_23);
                        _local_18 = Math.min(_local_18, _local_11.x);
                        _local_17 = Math.min(_local_17, _local_11.y);
                        _local_2 = Math.max(_local_2, _local_11.x);
                        _local_1 = Math.max(_local_1, _local_11.y);
                        _local_5 = _floorPlan.getHeightAt((_local_20 - 1), (_local_22 - 1));
                        _local_7 = _floorPlan.getHeightAt(_local_20, (_local_22 - 1));
                        _local_8 = _floorPlan.getHeightAt((_local_20 + 1), (_local_22 - 1));
                        _local_9 = _floorPlan.getHeightAt((_local_20 - 1), _local_22);
                        _local_10 = _floorPlan.getHeightAt((_local_20 + 1), _local_22);
                        _local_12 = _floorPlan.getHeightAt((_local_20 - 1), (_local_22 + 1));
                        _local_13 = _floorPlan.getHeightAt(_local_20, (_local_22 + 1));
                        _local_14 = _floorPlan.getHeightAt((_local_20 + 1), (_local_22 + 1));
                        _local_4 = (_local_23 + 1);
                        _local_16 = (((((((_local_5 == _local_4) || (_local_7 == _local_4)) || (_local_9 == _local_4)) ? 1 : 0) | ((((_local_8 == _local_4) || (_local_7 == _local_4)) || (_local_10 == _local_4)) ? 2 : 0)) | ((((_local_12 == _local_4) || (_local_13 == _local_4)) || (_local_9 == _local_4)) ? 4 : 0)) | ((((_local_14 == _local_4) || (_local_13 == _local_4)) || (_local_10 == _local_4)) ? 8 : 0));
                        if (_local_16 == 15)
                        {
                            _local_16 = 0;
                        };
                        if (_floorPlan.isEntryPoint(_local_20, _local_22))
                        {
                            _local_16 = (_tileImages.length - 1);
                        };
                        _local_15.push({
                            "point":_local_11,
                            "type":_local_16
                        });
                    };
                    _local_20++;
                };
                _local_22++;
            };
            var _local_21:int = Math.min(((_local_2 - _local_18) + 18), 4095);
            var _local_24:int = Math.min(((_local_1 - _local_17) + 18), 4095);
            var _local_19:BitmapData = new BitmapData(_local_21, _local_24, false, 0xFFFFFFFF);
            var _local_3:Point = new Point(-(_local_18), -(_local_17));
            for each (var _local_6:Object in _local_15)
            {
                _local_19.copyPixels(_tileImages[_local_6.type], _tileImages[_local_6.type].rect, _local_6.point.add(_local_3));
            };
            _bcFloorPlanEditor.updatePreviewBitmap(_local_19);
        }


    }
}//package com.sulake.habbo.window.utils.floorplaneditor

// _SafeStr_3478 = "tile_preview_entry_png$b93480326e7bf14cb366b995145e3ab8-1798235942" (String#20337, DoABC#4)


