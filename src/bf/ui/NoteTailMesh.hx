package bf.ui;
import starling.textures.TextureAtlas;
import starling.display.Quad;
import starling.textures.Texture;
import starling.display.MeshBatch;
import bf.asset.AssetManager;

/**
 * ...
 * @author Christopher Speciale
 */
class NoteTailMesh extends MeshBatch
{

	private var _outerTexture:Texture;
	private var _baseTexture:Texture;
	private var _highlightTexture:Texture;

	private var _outerQuad:Quad;
	private var _baseQuad:Quad;
	private var _highlightQuad:Quad;

	public var outerColor(get, set):UInt;
	public var innerColor(get, set):UInt;
	public var highlightColor(get, set):UInt;

	private function get_outerColor():UInt{
		return _outerQuad.color;
	}

	private function set_outerColor(value:UInt):UInt{
		_outerQuad.color = value;
		validate();
		return value;
	}

	private function get_innerColor():UInt{
		return _baseQuad.color;
	}

	private function set_innerColor(value:UInt):UInt{
		_baseQuad.color = value;
		validate();
		return value;
	}

	private function get_highlightColor():UInt{
		return _highlightQuad.color;
	}

	private function set_highlightColor(value:UInt):UInt{
		_highlightQuad.color = value;
		validate();
		return value;
	}
	
	//TURNS OUT THE CHEAPEST METHOD OF COLORING OUR NOTES WAS TO JUST SPLIT THEM UP INTO PARTS
	public function new() 
	{
		super();
		batchable = true;

		var spritesheet:TextureAtlas = AssetManager.getSpritesheet(UI);

		_baseTexture = spritesheet.getTexture("note_tail_base");
		_outerTexture = spritesheet.getTexture("note_tail_outline");
		_highlightTexture = spritesheet.getTexture("note_tail_highlight");

		_baseQuad = Quad.fromTexture(_baseTexture);

		_outerQuad = Quad.fromTexture(_outerTexture);

		_highlightQuad = Quad.fromTexture(_highlightTexture);

		validate();

		this.textureSmoothing = "none";


	}


	public function validate():Void{
		addMesh(_baseQuad);
		addMesh(_outerQuad);
		addMesh(_highlightQuad);
	}
	
}