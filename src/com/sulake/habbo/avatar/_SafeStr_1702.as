// by nota

//com.sulake.habbo.avatar._SafeStr_1702

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.events.Event;
    import com.sulake.habbo.avatar.structure.AvatarStructureDownload;
    import com.sulake.habbo.avatar.structure.IStructureData;
    import com.sulake.habbo.avatar.events.LibraryLoadedEvent;
    import com.sulake.core.assets.IAsset;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure._SafeStr_3125;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3177;
    import com.sulake.habbo.utils.FigureDataContainer;
    import com.sulake.habbo.avatar.animation._SafeStr_3136;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.iid.*;

    [SecureSWF(rename="true")]
    public class _SafeStr_1702 extends Component implements _SafeStr_1701 
    {

        private const AVATAR_PLACEHOLDER_FIGURE:String = "hd-99999-99999";

        private var _aliasCollection:AssetAliasCollection;
        private var _SafeStr_3762:AvatarStructure;
        private var _SafeStr_3771:String;
        private var _petImageListeners:_SafeStr_24;
        private var _SafeStr_3763:AvatarAssetDownloadManager;
        private var _SafeStr_3764:EffectAssetDownloadManager;
        private var _SafeStr_3772:AvatarFigureContainer;
        private var _SafeStr_3767:Boolean = false;
        private var _SafeStr_3768:Boolean = false;
        private var _SafeStr_3766:Boolean = false;
        private var _inNuxFlow:Boolean;
        private var _SafeStr_3769:Boolean;
        private var _SafeStr_3765:Boolean;
        private var _SafeStr_3770:Array = [];

        public function _SafeStr_1702(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:IAssetLibrary, _arg_4:Boolean=false)
        {
            _inNuxFlow = _arg_4;
            _arg_2 = (_arg_2 | 0x04);
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return ((_inNuxFlow) ? super.dependencies : super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
    "type":"complete",
    "callback":onConfigurationComplete
}])]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3771 = "component";
            _petImageListeners = new _SafeStr_24();
            var _local_1:XML = <actions><action  id="Default" precedence="1000" state="std" main="1" isdefault="1" geometrytype="vertical" activepartset="figure" assetpartdefinition="std"/>	<!-- baked in actions for snowwar -->
				<action  id="SnowWarRun" state="swrun" precedence="104" main="1" geometrytype="vertical" activepartset="snowwarrun" assetpartdefinition="swrun" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarDieFront" state="swdiefront" precedence="105" main="1" geometrytype="swhorizontal" activepartset="snowwardiefront" assetpartdefinition="swdie" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarDieBack" state="swdieback" precedence="106" main="1" geometrytype="swhorizontal" activepartset="snowwardieback" assetpartdefinition="swdie" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarPick" state="swpick" precedence="107" main="1" geometrytype="vertical" activepartset="snowwarpick" assetpartdefinition="swpick" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarThrow" state="swthrow" precedence="108" main="1" geometrytype="vertical" activepartset="snowwarthrow" assetpartdefinition="swthrow" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx.174,fx175,fx176,dance"/>
			</actions>
            ;
            _SafeStr_3762 = new AvatarStructure(this);
            _SafeStr_3762.initGeometry(((assets.hasAsset("HabboAvatarGeometry")) ? (assets.getAssetByName("HabboAvatarGeometry").content as XML) : null));
            _SafeStr_3762.initPartSets(((assets.hasAsset("HabboAvatarPartSets")) ? (assets.getAssetByName("HabboAvatarPartSets").content as XML) : null));
            _SafeStr_3762.initActions(assets, _local_1);
            _SafeStr_3762.initAnimation(((assets.hasAsset("HabboAvatarAnimation")) ? (assets.getAssetByName("HabboAvatarAnimation").content as XML) : null));
            _SafeStr_3762.initFigureData(((assets.hasAsset("HabboAvatarFigure")) ? (assets.getAssetByName("HabboAvatarFigure").content as XML) : null));
            _aliasCollection = new AssetAliasCollection(this, (context.assets as AssetLibraryCollection));
            _aliasCollection.init();
            checkIfReady();
        }

        private function requestActions():void
        {
            var _local_3:String = (getProperty("flash.dynamic.avatar.download.url") + "HabboAvatarActions.xml");
            var _local_1:URLRequest = new URLRequest(_local_3);
            var _local_2:AssetLoaderStruct = assets.loadAssetFromFile("HabboAvatarActions", _local_1, "text/xml");
            _local_2.addEventListener("AssetLoaderEventComplete", onAvatarActionsLoaded);
        }

        private function onAvatarActionsLoaded(_arg_1:Event=null):void
        {
            if (_SafeStr_3762 == null)
            {
                return;
            };
            var _local_2:XML = <actions><action  id="Default" precedence="1000" state="std" main="1" isdefault="1" geometrytype="vertical" activepartset="figure" assetpartdefinition="std"/>	<!-- baked in actions for snowwar -->
				<action  id="SnowWarRun" state="swrun" precedence="104" main="1" geometrytype="vertical" activepartset="snowwarrun" assetpartdefinition="swrun" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarDieFront" state="swdiefront" precedence="105" main="1" geometrytype="swhorizontal" activepartset="snowwardiefront" assetpartdefinition="swdie" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarDieBack" state="swdieback" precedence="106" main="1" geometrytype="swhorizontal" activepartset="snowwardieback" assetpartdefinition="swdie" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarPick" state="swpick" precedence="107" main="1" geometrytype="vertical" activepartset="snowwarpick" assetpartdefinition="swpick" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx174,fx175,fx176,dance"/>
				<action  id="SnowWarThrow" state="swthrow" precedence="108" main="1" geometrytype="vertical" activepartset="snowwarthrow" assetpartdefinition="swthrow" startfromframezero="true" prevents="fx.2,fx.3,fx.6,fx.14,fx.15,fx.17,fx.18,fx.19,fx.20,fx.21,fx.22,fx.33,fx.34,fx.35,fx.36,fx.38,fx.39,fx.45,fx.46,fx.48,fx.54,fx.55,fx.56,fx.57,fx.58,fx.69,fx.71,fx.72,fx.89,fx.90,fx.91,fx.92,fx.94,fx.97,fx.100,fx.104,fx.105,fx.107,fx.108,fx.115,fx.116,fx.117,fx.118,fx.119,fx.120,fx.121,fx.122,fx.123,fx.124,fx.125,fx.127,fx.129,fx.130,fx.131,fx.132,fx.134,fx.135,fx.136,fx.137,fx.138,fx.139,fx.140,fx.141,fx.142,fx.143,fx.144,fx.145,fx.146,fx.147,fx.148,fx.149,fx.150,fx.151,fx.152,fx.153,fx.154,fx.155,fx.156,fx.157,fx.158,fx.159,fx.160,fx.161,fx.162,fx.164,fx.165,fx.166,fx167,fx168,fx169,fx170,fx171,fx172,fx173,fx.174,fx175,fx176,dance"/>
			</actions>
            ;
            _SafeStr_3762.updateActions(((assets.hasAsset("HabboAvatarActions")) ? (assets.getAssetByName("HabboAvatarActions").content as XML) : _local_2));
            _SafeStr_3769 = true;
            checkIfReady();
        }

        override public function dispose():void
        {
            super.dispose();
            if (_SafeStr_3762 != null)
            {
                _SafeStr_3762.dispose();
                _SafeStr_3762 = null;
            };
            if (_aliasCollection != null)
            {
                _aliasCollection.dispose();
                _aliasCollection = null;
            };
            if (_petImageListeners)
            {
                _petImageListeners.dispose();
                _petImageListeners = null;
            };
            if (_SafeStr_3763)
            {
                _SafeStr_3763.removeEventListener("complete", onAvatarAssetsDownloadManagerReady);
                _SafeStr_3763.dispose();
                _SafeStr_3763 = null;
            };
            if (_SafeStr_3764)
            {
                _SafeStr_3764.removeEventListener("complete", onAvatarAssetsDownloadManagerReady);
                _SafeStr_3764.dispose();
                _SafeStr_3764 = null;
            };
            _SafeStr_3770 = null;
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            requestActions();
            if (_SafeStr_3762 != null)
            {
                _local_4 = getProperty("external.figurepartlist.txt");
                if (assets.hasAsset(_local_4))
                {
                    assets.removeAsset(assets.getAssetByName(_local_4));
                };
                _local_3 = new AvatarStructureDownload(assets, _local_4, (_SafeStr_3762.figureData as IStructureData));
                _local_3.addEventListener("AVATAR_STRUCTURE_DONE", onFigureDataDownloadDone);
                if (_SafeStr_3763 == null)
                {
                    _local_2 = getProperty("flash.dynamic.avatar.download.configuration");
                    _local_6 = getProperty("flash.dynamic.avatar.download.url");
                    _local_7 = getProperty("flash.dynamic.avatar.download.name.template");
                    _SafeStr_3763 = new AvatarAssetDownloadManager(this, context.assets, _local_2, _local_6, _SafeStr_3762, _local_7);
                    _SafeStr_3763.addEventListener("complete", onAvatarAssetsDownloadManagerReady);
                    _SafeStr_3763.addEventListener("LIBRARY_LOADED", onAvatarAssetsLibraryReady);
                };
                if (_SafeStr_3764 == null)
                {
                    _local_5 = (getProperty("flash.dynamic.avatar.download.url") + "effectmap.xml");
                    _local_6 = getProperty("flash.dynamic.avatar.download.url");
                    _local_7 = getProperty("flash.dynamic.avatar.download.name.template");
                    _SafeStr_3764 = new EffectAssetDownloadManager(context.assets, _local_5, _local_6, _SafeStr_3762, _local_7);
                    _SafeStr_3764.addEventListener("complete", onEffectAssetsDownloadManagerReady);
                    _SafeStr_3764.addEventListener("LIBRARY_LOADED", onEffectAssetsLibraryReady);
                };
            };
        }

        public function onMandatoryLibrariesReady():void
        {
            checkIfReady();
        }

        private function onAvatarAssetsLibraryReady(_arg_1:LibraryLoadedEvent):void
        {
            _aliasCollection.onAvatarAssetsLibraryReady(_arg_1.library);
        }

        private function onEffectAssetsLibraryReady(_arg_1:LibraryLoadedEvent):void
        {
            _aliasCollection.onAvatarAssetsLibraryReady(_arg_1.library);
        }

        private function onFigureDataDownloadDone(_arg_1:Event=null):void
        {
            var _local_2:IAsset = assets.getAssetByName(getProperty("external.figurepartlist.txt"));
            if (_local_2)
            {
                assets.removeAsset(_local_2).dispose();
            };
            _SafeStr_3768 = true;
            _SafeStr_3762.init();
            checkIfReady();
        }

        private function onAvatarAssetsDownloadManagerReady(_arg_1:Event=null):void
        {
            _SafeStr_3767 = true;
            checkIfReady();
        }

        private function onEffectAssetsDownloadManagerReady(_arg_1:Event=null):void
        {
            _SafeStr_3765 = true;
            checkIfReady();
        }

        public function get effectMap():Dictionary
        {
            if (_SafeStr_3765)
            {
                return (_SafeStr_3764.map);
            };
            return (null);
        }

        private function checkIfReady():void
        {
            if (!_SafeStr_3766)
            {
                if (((((_SafeStr_3767) && (_SafeStr_3768)) && (_SafeStr_3769)) && (_SafeStr_3765)))
                {
                    _SafeStr_3766 = true;
                    this.events.dispatchEvent(new Event("AVATAR_RENDER_READY"));
                    purgeInitDownloadBuffer();
                };
            };
        }

        private function purgeInitDownloadBuffer():void
        {
            var _local_1:* = null;
            if (_SafeStr_3770)
            {
                for each (var _local_2:Array in _SafeStr_3770)
                {
                    _local_1 = _local_2[1];
                    if (((!(_local_1 == null)) && (!(_local_1.disposed))))
                    {
                        _SafeStr_3763.loadFigureSetData((_local_2[0] as _SafeStr_3164), _local_1);
                    };
                };
                _SafeStr_3770 = [];
            };
        }

        public function createFigureContainer(_arg_1:String):_SafeStr_3164
        {
            return (new AvatarFigureContainer(_arg_1));
        }

        public function isFigureReady(_arg_1:_SafeStr_3164):Boolean
        {
            if (!_SafeStr_3763)
            {
                return (false);
            };
            return (_SafeStr_3763.isReady(_arg_1));
        }

        public function downloadFigure(_arg_1:_SafeStr_3164, _arg_2:_SafeStr_1875):void
        {
            if (!_SafeStr_3763)
            {
                _SafeStr_3770.push([_arg_1, _arg_2]);
                return;
            };
            _SafeStr_3763.loadFigureSetData(_arg_1, _arg_2);
        }

        public function createAvatarImage(_arg_1:String, _arg_2:String, _arg_3:String=null, _arg_4:_SafeStr_1875=null, _arg_5:_SafeStr_3139=null):_SafeStr_3138
        {
            var _local_6:* = null;
            var _local_7:AvatarFigureContainer = new AvatarFigureContainer(_arg_1);
            if (_SafeStr_3762 == null)
            {
                _SafeStr_3770.push([_local_7, _arg_4]);
                return (null);
            };
            if (((!(_SafeStr_3763)) && (!(_SafeStr_3771 == "local_only"))))
            {
                _SafeStr_3770.push([_local_7, _arg_4]);
                return (null);
            };
            if (_arg_3)
            {
                validateAvatarFigure(_local_7, _arg_3);
            };
            if (((_SafeStr_3771 == "local_only") || (_SafeStr_3763.isReady(_local_7))))
            {
                return (new AvatarImage(_SafeStr_3762, _aliasCollection, _local_7, _arg_2, _SafeStr_3764, _arg_5));
            };
            if (!_SafeStr_3772)
            {
                _SafeStr_3772 = new AvatarFigureContainer("hd-99999-99999");
            };
            _local_6 = new PlaceholderAvatarImage(_SafeStr_3762, _aliasCollection, _SafeStr_3772, _arg_2, _SafeStr_3764);
            _SafeStr_3763.loadFigureSetData(_local_7, _arg_4);
            return (_local_6);
        }

        public function getFigureData():_SafeStr_3125
        {
            if (_SafeStr_3762)
            {
                return (_SafeStr_3762.figureData);
            };
            return (null);
        }

        public function isValidFigureSetForGender(_arg_1:int, _arg_2:String):Boolean
        {
            var _local_3:_SafeStr_3125 = getFigureData();
            var _local_4:_SafeStr_3177 = _local_3.getFigurePartSet(_arg_1);
            if (_local_4 != null)
            {
                if (((_local_4.gender.toUpperCase() == "U") || (_local_4.gender.toUpperCase() == _arg_2.toUpperCase())))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function getFigureStringWithFigureIds(_arg_1:String, _arg_2:String, _arg_3:Vector.<int>):String
        {
            var _local_6:FigureDataContainer = new FigureDataContainer();
            _local_6.loadAvatarData(_arg_1, _arg_2);
            var _local_4:Vector.<_SafeStr_3177> = resolveFigureSets(_arg_3);
            for each (var _local_5:_SafeStr_3177 in _local_4)
            {
                _local_6.savePartData(_local_5.type, _local_5.id, _local_6.getColourIds(_local_5.type));
            };
            return (_local_6.getFigureString());
        }

        private function resolveFigureSets(_arg_1:Vector.<int>):Vector.<_SafeStr_3177>
        {
            var _local_4:* = null;
            var _local_2:_SafeStr_3125 = getFigureData();
            var _local_3:Vector.<_SafeStr_3177> = new Vector.<_SafeStr_3177>(0);
            for each (var _local_5:int in _arg_1)
            {
                _local_4 = _local_2.getFigurePartSet(_local_5);
                if (_local_4 != null)
                {
                    _local_3.push(_local_4);
                };
            };
            return (_local_3);
        }

        public function getItemIds():Array
        {
            return (_SafeStr_3762.getItemIds());
        }

        public function getAnimationManager():_SafeStr_3136
        {
            if (_SafeStr_3762)
            {
                return (_SafeStr_3762.animationManager);
            };
            return (null);
        }

        public function getMandatoryAvatarPartSetIds(_arg_1:String, _arg_2:int):Array
        {
            if (_SafeStr_3762)
            {
                return (_SafeStr_3762.getMandatorySetTypeIds(_arg_1, _arg_2));
            };
            return (null);
        }

        public function getAssetByName(_arg_1:String):IAsset
        {
            return (_aliasCollection.getAssetByName(_arg_1));
        }

        public function get mode():String
        {
            return (_SafeStr_3771);
        }

        public function set mode(_arg_1:String):void
        {
            _SafeStr_3771 = _arg_1;
        }

        public function injectFigureData(_arg_1:XML):void
        {
            if (_SafeStr_3762 != null)
            {
                _SafeStr_3762.injectFigureData(_arg_1);
            };
        }

        private function validateAvatarFigure(_arg_1:AvatarFigureContainer, _arg_2:String):Boolean
        {
            var _local_5:Boolean;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_11:* = null;
            var _local_4:* = null;
            var _local_9:* = null;
            if (!_SafeStr_3762)
            {
                ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: structure is null!");
            };
            var _local_10:int = 2;
            var _local_6:Array = _SafeStr_3762.getMandatorySetTypeIds(_arg_2, _local_10);
            if (_local_6)
            {
                _local_3 = _SafeStr_3762.figureData;
                if (!_local_3)
                {
                    ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: figureData is null!");
                };
                for each (var _local_8:String in _local_6)
                {
                    if (!_arg_1.hasPartType(_local_8))
                    {
                        _local_7 = _SafeStr_3762.getDefaultPartSet(_local_8, _arg_2);
                        if (_local_7)
                        {
                            _arg_1.updatePart(_local_8, _local_7.id, [0]);
                            _local_5 = true;
                        };
                    }
                    else
                    {
                        _local_11 = _local_3.getSetType(_local_8);
                        if (!_local_11)
                        {
                            ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: setType is null!");
                        };
                        _local_4 = _local_11.getPartSet(_arg_1.getPartSetId(_local_8));
                        if (!_local_4)
                        {
                            _local_9 = _SafeStr_3762.getDefaultPartSet(_local_8, _arg_2);
                            if (_local_9)
                            {
                                _arg_1.updatePart(_local_8, _local_9.id, [0]);
                                _local_5 = true;
                            };
                        };
                    };
                };
            };
            return (!(_local_5));
        }

        public function resolveClubLevel(_arg_1:_SafeStr_3164, _arg_2:String, _arg_3:Array=null):int
        {
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_13:int;
            var _local_12:* = null;
            var _local_14:* = null;
            var _local_11:* = null;
            var _local_5:* = null;
            var _local_6:int;
            if (!_SafeStr_3762)
            {
                return (0);
            };
            var _local_10:_SafeStr_3125 = _SafeStr_3762.figureData;
            var _local_4:Array = _arg_1.getPartTypeIds();
            for each (_local_15 in _local_4)
            {
                _local_9 = _local_10.getSetType(_local_15);
                _local_13 = _arg_1.getPartSetId(_local_15);
                _local_12 = _local_9.getPartSet(_local_13);
                if (_local_12 != null)
                {
                    _local_6 = Math.max(_local_12.clubLevel, _local_6);
                    _local_14 = _local_10.getPalette(_local_9.paletteID);
                    _local_11 = _arg_1.getPartColorIds(_local_15);
                    for each (var _local_7:int in _local_11)
                    {
                        _local_5 = _local_14.getColor(_local_7);
                        _local_6 = Math.max(_local_5.clubLevel, _local_6);
                    };
                };
            };
            if (_arg_3 == null)
            {
                _arg_3 = _SafeStr_3762.getBodyPartsUnordered("full");
            };
            for each (var _local_8:String in _arg_3)
            {
                _local_9 = _local_10.getSetType(_local_8);
                if (_local_4.indexOf(_local_8) == -1)
                {
                    _local_6 = Math.max(_local_9.optionalFromClubLevel(_arg_2), _local_6);
                };
            };
            return (_local_6);
        }

        public function resetAssetManager():void
        {
            _aliasCollection.reset();
        }

        public function get isReady():Boolean
        {
            return (_SafeStr_3766);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1702 = "_-E0" (String#5991, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3136 = "_-q1r" (String#12537, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3202 = "_-P1H" (String#6065, DoABC#4)
// _SafeStr_3762 = "_-Q11" (String#1051, DoABC#4)
// _SafeStr_3763 = "_-v16" (String#3987, DoABC#4)
// _SafeStr_3764 = "_-Q1f" (String#5233, DoABC#4)
// _SafeStr_3765 = "_-a1v" (String#14100, DoABC#4)
// _SafeStr_3766 = "_-02c" (String#14246, DoABC#4)
// _SafeStr_3767 = "_-F1M" (String#18608, DoABC#4)
// _SafeStr_3768 = "_-Ih" (String#22523, DoABC#4)
// _SafeStr_3769 = "_-h1y" (String#17568, DoABC#4)
// _SafeStr_3770 = "_-X1n" (String#2917, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_3772 = "_-F1r" (String#15498, DoABC#4)


