from json import loads


class CV:
    def __init__(self, json: str, lang: str = 'pt'):
        with open(json, encoding='utf-8') as file:
            cv = loads(file.read())
        
        self.links = cv['links']
        self.language = cv['language'][lang]
        self.skills = cv['skills'][lang]
        self.education = cv['education'][lang]
        self.experience = cv['experience'][lang]
        self.certifications = cv['certifications'][lang]
        self.publications = cv['publications'][lang]
        self.projects = cv['projects'][lang]
        self.sections = cv['sections'][lang]
    
    def links(self):
        tex = '\section{' + f'{self.sections["links"]}' + '}\n'
        for k, v in self.links.items():
            tex += f'{k}' + ':\\ \href{' f'{v}' + '}{' + f'{v}' + '\\\\ \n'
        tex[-7:] = ''
        return tex
    
    def languages(self):
        tex = '\section{' + f'{self.sections["languages"]}' + '}\n'
        for k, v in self.languages.items():
            tex += f'{k}: {v}\\\\ \n'
        tex[-7:] = ''
        return tex
    
    def skills(self):
        tex = '\section{' + f'{self.sections["skills"]}' + '}\n'
        return tex
    
    def experience(self):
        tex = '\section{' + f'{self.sections["experience"]}' + '}\n'
        return tex
    
    def education(self):
        tex = '\section{' + f'{self.sections["education"]}' + '}\n'
        return tex
    
    def certifications(self):
        tex = '\section{' + f'{self.sections["certifications"]}' + '}\n'
        return tex
    
    def publications(self):
        tex = '\section{' + f'{self.sections["publications"]}' + '}\n'
        return tex
    
    def projects(self):
        tex = '\section{' + f'{self.sections["projects"]}' + '}\n'
        return tex


if __name__ == '__main__':
    