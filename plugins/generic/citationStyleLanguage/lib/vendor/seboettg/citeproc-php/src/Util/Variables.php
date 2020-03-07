<?php
/*
 * citeproc-php
 *
 * @link        http://github.com/seboettg/citeproc-php for the source repository
 * @copyright   Copyright (c) 2016 Sebastian Böttger.
 * @license     https://opensource.org/licenses/MIT
 */

namespace Seboettg\CiteProc\Util;
use InvalidArgumentException;
use Seboettg\CiteProc\Exception\CiteProcException;
use Seboettg\CiteProc\Exception\InvalidStylesheetException;
use Seboettg\CiteProc\Rendering\Name\Names;
use SimpleXMLElement;
use stdClass;


/**
 * Class Variables
 * @package Seboettg\CiteProc\Util
 *
 * @author Sebastian Böttger <seboettg@gmail.com>
 */
class Variables
{

    const NAME_VARIABLES = [
        'author',               //author
        'collection-editor',    //editor of the collection holding the item (e.g. the series editor for a book)
        'composer',             //composer (e.g. of a musical score)
        'container-author',     //author of the container holding the item (e.g. the book author for a book chapter)
        'director',             //director (e.g. of a film)
        'editor',               //editor
        'editorial-director',   //managing editor (“Directeur de la Publication” in French)
        'illustrator',          //illustrator (e.g. of a children’s book)
        'interviewer',          //interviewer (e.g. of an interview)
        'original-author',      //
        'recipient',            //recipient (e.g. of a letter)
        'reviewed-author'       //author of the item reviewed by the current item
    ];

    const NUMBER_VARIABLES = [
        'chapter-number',       //chapter number
        'collection-number',    //number identifying the collection holding the item (e.g. the series number for a book)
        'edition',              //(container) edition holding the item (e.g. “3” when citing a chapter in the third
                                //edition of a book)
        'issue',                //(container) issue holding the item (e.g. “5” when citing a journal article from
                                //journal volume 2, issue 5)
        'number',               //number identifying the item (e.g. a report number)
        'number-of-pages',      //total number of pages of the cited item
        'number-of-volumes',    //total number of volumes, usable for citing multi-volume books and such
        'volume'                //(container) volume holding the item (e.g. “2” when citing a chapter from book volume 2)
    ];

    const DATE_VARIABLES = [
        'accessed',             //date the item has been accessed
        'container',
        'event-date',           //date the related event took place
        'issued',               //date the item was issued/published
        'original-date',        //(issue) date of the original version
        'submitted'             //date the item (e.g. a manuscript) has been submitted for publication
    ];

    const STANDARD_VARIABLE = [
        'abstract',             //abstract of the item (e.g. the abstract of a journal article)
        'annote',               //reader’s notes about the item content
        'archive',              //archive storing the item
        'archive-location',     //storage location within an archive (e.g. a box and folder number)
        'archive-place',        //geographic location of the archive
        'authority',            //issuing or judicial authority (e.g. “USPTO” for a patent, “Fairfax Circuit Court” for
                                //a legal case)
        'call-number',          //call number (to locate the item in a library)
        'citation-label',       //label identifying the item in in-text citations of label styles (e.g. “Ferr78”). May
                                //be assigned by the CSL processor based on item metadata.
        'citation-number',      //index (starting at 1) of the cited reference in the bibliography (generated by the CSL
                                //processor)
        'collection-title',     //title of the collection holding the item (e.g. the series title for a book)
        'container-title',      //title of the container holding the item (e.g. the book title for a book chapter, the
                                //journal title for a journal article)
        'container-title-short',//short/abbreviated form of “container-title” (also accessible through the “short” form
                                //of the “container-title” variable)
        'dimensions',           //physical (e.g. size) or temporal (e.g. running time) dimensions of the item
        'DOI',                  //Digital Object Identifier (e.g. “10.1128/AEM.02591-07”)
        'event',                //name of the related event (e.g. the conference name when citing a conference paper)
        'event-place',          //geographic location of the related event (e.g. “Amsterdam, the Netherlands”)
        'first-reference-note-number', //number of a preceding note containing the first reference to the item. Assigned
                                // by the CSL processor. The variable holds no value for non-note-based styles, or when
                                // the item hasn’t been cited in any preceding notes.
        'genre',                //class, type or genre of the item (e.g. “adventure” for an adventure movie,
                                //“PhD dissertation” for a PhD thesis),
        'ISBN',                 //International Standard Book Number
        'ISSN',                 //International Standard Serial Number
        'jurisdiction',         //geographic scope of relevance (e.g. “US” for a US patent)
        'keyword',              //keyword(s) or tag(s) attached to the item
        'locator',              //a cite-specific pinpointer within the item (e.g. a page number within a book, or a
                                //volume in a multi-volume work). Must be accompanied in the input data by a label
                                //indicating the locator type (see the Locators term list), which determines which term
                                //is rendered by cs:label when the “locator” variable is selected.
        'medium',               //medium description (e.g. “CD”, “DVD”, etc.)
        'note',                 //(short) inline note giving additional item details (e.g. a concise summary or commentary)
        'original-publisher',   //original publisher, for items that have been republished by a different publisher
        'original-publisher-place', //geographic location of the original publisher (e.g. “London, UK”)
        'original-title',       //title of the original version (e.g. “Война и мир”, the untranslated Russian title of
                                // “War and Peace”)
        'page',                 //range of pages the item (e.g. a journal article) covers in a container (e.g. a journal
                                // issue)
        'page-first',           //first page of the range of pages the item (e.g. a journal article) covers in a
                                //container (e.g. a journal issue)
        'PMCID',                //PubMed Central reference number
        'PMID',                 //PubMed reference number
        'publisher',            //publisher
        'publisher-place',      //geographic location of the publisher
        'references',           //resources related to the procedural history of a legal case
        'reviewed-title',       //title of the item reviewed by the current item
        'scale',                //scale of e.g. a map
        'section',              //container section holding the item (e.g. “politics” for a newspaper article)
        'source',               //from whence the item originates (e.g. a library catalog or database)
        'status',               //(publication) status of the item (e.g. “forthcoming”)
        'title',                //primary title of the item
        'title-short',          //short/abbreviated form of “title” (also accessible through the “short” form of the
                                //“title” variable)
        'URL',                  //Uniform Resource Locator (e.g. “http://aem.asm.org/cgi/content/full/74/9/2766”)
        'version',              //version of the item (e.g. “2.0.9” for a software program)
        'year-suffix',          //disambiguating year suffix in author-date styles (e.g. “a” in “Doe, 1999a”)


    ];

    /**
     * @param $name
     * @return bool
     */
    public static function isDateVariable($name)
    {
        return in_array($name, self::DATE_VARIABLES);
    }

    /**
     * @param $name
     * @return bool
     */
    public static function isNumberVariable($name)
    {
        return in_array($name, self::NUMBER_VARIABLES);
    }

    /**
     * @param $name
     * @return bool
     */
    public static function isNameVariable($name)
    {
        return in_array($name, self::NAME_VARIABLES);
    }

    /**
     * @param stdClass $data
     * @param string $variable
     * @return string
     * @throws InvalidStylesheetException
     * @throws CiteProcException
     */
    public static function nameHash(stdClass $data, $variable)
    {
        if (!self::isNameVariable($variable)) {
            throw new InvalidArgumentException("\"$variable\" is not a valid name variable.");
        }

        $names = new Names(new SimpleXMLElement("<names variable=\"$variable\" delimiter=\"-\"><name form=\"long\" sort-separator=\",\" name-as-sort-order=\"all\"/></names>"), null);
        return $names->render($data);
    }
}